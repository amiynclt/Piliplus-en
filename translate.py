#!/usr/bin/env python3
import os, re, json, time, sys
import urllib.parse, urllib.request

CACHE = "translate_cache.json"
cache = {}
if os.path.exists(CACHE):
    cache = json.load(open(CACHE, encoding="utf-8"))
    print(f"Resuming — {len(cache)} entries already cached")

def save():
    json.dump(cache, open(CACHE, "w", encoding="utf-8"),
              ensure_ascii=False, indent=2)

def translate(text):
    if not text.strip() or text in cache:
        return cache.get(text, text)
    q = urllib.parse.quote(text)
    url = ("https://translate.googleapis.com/translate_a/single"
           f"?client=gtx&sl=zh-CN&tl=en&dt=t&q={q}")
    for attempt in range(4):
        try:
            req = urllib.request.Request(url,
                    headers={"User-Agent": "Mozilla/5.0"})
            with urllib.request.urlopen(req, timeout=20) as r:
                data = json.loads(r.read().decode())
            result = "".join(seg[0] for seg in data[0] if seg[0])
            cache[text] = result
            return result
        except Exception:
            time.sleep(2 * (attempt + 1))
    print(f"FAIL: {text[:50]}")
    cache[text] = text
    return text

pattern = re.compile(
    r"(['\"])((?:[^'\"\\\n]|\\.)*?[\u4e00-\u9fff](?:[^'\"\\\n]|\\.)*?)\1"
)

SKIP = [
    re.compile(r"^https?://"),
    re.compile(r"^/"),
    re.compile(r"^@"),
    re.compile(r"^[a-zA-Z0-9_\-\.:/?=&%#\s]+$"),
]

def skip(s):
    s = s.strip()
    if not s or len(s) == 1:
        return True
    return any(p.match(s) for p in SKIP)

files = []
for root, _, fs in os.walk("lib"):
    for f in fs:
        if f.endswith(".dart"):
            files.append(os.path.join(root, f))

uniq = set()
for path in files:
    src = open(path, encoding="utf-8").read()
    for m in pattern.finditer(src):
        s = m.group(2)
        if not skip(s):
            uniq.add(s)

todo = [s for s in uniq if s not in cache]
print(f"{len(files)} files, {len(uniq)} unique strings, {len(todo)} to translate")

for i, s in enumerate(todo, 1):
    translate(s)
    if i % 25 == 0:
        save()
        print(f"  [{i}/{len(todo)}] cached {len(cache)}")
    time.sleep(0.1)

save()
print(f"Cache: {len(cache)} entries. Rewriting files...")

changed = 0
for path in files:
    src = open(path, encoding="utf-8").read()
    def repl(m):
        q, t = m.group(1), m.group(2)
        if skip(t):
            return m.group(0)
        return f"{q}{cache.get(t, t)}{q}"
    new = pattern.sub(repl, src)
    if new != src:
        open(path, "w", encoding="utf-8").write(new)
        changed += 1

print(f"Done. {changed} files rewritten.")

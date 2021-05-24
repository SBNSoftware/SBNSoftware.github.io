---
layout: page
title: Importing Redmine Wiki
---

Porting old redmine wiki pages is rather cumbersome. I have manage to automate part of the process, 
but it is still necessary to do some manual editing after the instructions I show here.

What I did to port the `sbndcode, icaruscode,` and `sbndaq` was to download all the relevant `html` files.

In order to do that, you need to be an admin of the redmine project. Log in on your redmine account and at the bottom right there’s this note

```
Also available in:  PDF HTML TXT
```

Click the `HTML` link to download the page.

Then convert that to markdown.

I did it with `pandoc`
```bash
pandoc -f html -t markdown -s Old_Redmine.html -o Ported.md
```

If there are several `html` files you can use:
```bash
find . -name "*.html" -type f -exec sh -c 'pandoc -f html -t markdown  -s "$1" -o "${1%.*}.md"' find-sh {} \;
```


Add them to your git tree:
```bash
git add Ported.md
git commit -m "Adding Ported.md"
```

To remove junk:
```bash
git grep -lz --fixed-strings '{.wiki-anchor}' | xargs -0 sed -i '' -e 's/{.wiki-anchor}//g'
git grep -lz --fixed-strings '[¶]' | xargs -0 sed -i '' -e 's/[¶]//g'
git grep -lz --fixed-strings '[]' | xargs -0 sed -i '' -e 's/\[\]//g'
git grep -lz --extended-regex '(\{\#.*\})' | xargs -0 sed -i '' -e 's/{#.*}//g'
git grep -lz --extended-regex '(\(\#.*\))' | xargs -0 sed -i '' -e 's/(#.*)//g'
git grep -lz --fixed-strings '{.wiki-page}' | xargs -0 sed -i '' -e 's/{.wiki-page}//g'
git grep -lz --fixed-strings '{.external}' | xargs -0 sed -i '' -e 's/{.external}//g'
```

To make it jekyl compatible:
```bash
git grep -lz --extended-regex 'lang: en'  | xargs -0 sed -i '' -e 's/lang: en/layout: page/g'
```

Commit the changes
```bash
git add Ported.md
git commit -m "Removing junk from Ported.md"
```

Proceed with manual editing.

Make sure to put the file on the right folder, and to link it from somewhere else. 

Created by: Iker de Icaza (@ikatza)

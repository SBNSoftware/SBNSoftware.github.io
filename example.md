---
layout: page
title: Example Page
subtitle: Example Page Subtitle
description: Example Page Description
toc: true
---


The source code of our wiki is written in `MarkDown`, like on Slack. You can see [basic markdown highlighting](https://www.markdownguide.org/basic-syntax/). 
Behind the scenes `jekyll` renders the contents.

At the very top of every md file there should be a block like this:

```
---
layout: page                             # mandatory, use page always
title: Example Page                      # mandatory
subtitle: Example Page Subtitle          # optional
description: Example Page Description    # optional
toc: true                                # optional
---
```

There is code highlighting enabled. For that after the triple tick name the language. 

Some examples:


**Bash**
```bash
echo "Bash Higlighting"
cd love_larsoft
```

**C++**
```c++
const int rankOfThisWiki = 1;
const std::string call_for_wikitypists = "Please contribute to our wiki";
```

**Python**
```python
import numpy as np
def neat_wiki_function(content)
```

**LaTeX**
```latex
\chapter{The SBND Experiment and the SBN Programme}
\begin{itemize}
\item List 1
\item List 2
\end{itemize}
```

For math, you can have: Inline math $f(x)=x^2$

Long math $\max\limits_\theta L_{\theta_0}(\theta)$, subject to $D_{KL}^{\rho_{\theta_0}}(\theta_0,\theta)\le\delta$, where $D_{KL}^\rho(\theta_1,\theta_2)=\mathbb{E}\_{s\sim\rho}[D\_{KL}(\pi\_{\theta_1}(\cdot\vert s)\mid\mid\pi\_{\theta_2}(\cdot\vert s))]$

Centered math
$$f(x)=x^2$$
$$P_{\alpha \rightarrow \beta ,\alpha \neq \beta }=\sin ^{2}(2\theta )\sin ^{2}\left(1.27{\frac {\Delta m^{2}L}{E}}{\frac {\rm {[eV^{2}]\,[km]}}{\rm {[GeV]}}}\right)$$

[List of supported languages](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers)



# Top Heading 

Some text under top heading

## Sub Heading

Text in this section

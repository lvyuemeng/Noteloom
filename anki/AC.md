$$
p = vi^* = p_{real} cos(\delta-\beta) + ip_{reactive}cos(\delta-\beta)
$$

in which $cos(\delta-\beta)$ called **power factor**,aka **$p.f.$**, and $|p|$ called **apparent power**

$$
S = P+jQ \\
p.f. = cos(\delta-\beta) = P/S 
$$

We restrict:

$P>0 \quad Q>0$ as absorbed by element
$P<0 \quad Q<0$ as supplied by element

$$
S_{resistor} = VI^* = Ve^{i\delta}V/R \, e^{-i\delta} = V^2/R \\
S_{capacitor} = V\angle\delta \, (-j\omega CV\angle-\delta) = -j\omega CV^2 \\
S_{inductor} = V\angle\delta \, (\frac{V}{-j\omega L}\angle-\delta) = jV^2/\omega L
$$

## 3 Phase

<figure>
  <img src="/assets/3phase1.png" alt="alt text" height="auto">
</figure>

**line voltage** can be derive from **phase voltage**(draw diagram to check!)
$$
\begin{align}
V_{ab} &= V_{an}+V_{nb} = V_{N}-V_{N}\angle-120 \degree \\
	&= V_{N}[1-(-\frac{1}{2} - j\frac{\sqrt{3}}{2})] \\
	&= V_{N}[\frac{3}{2} - j\frac{\sqrt{3}}{2}] \\
	&= \sqrt{3}V_{N}\angle 30 \degree \\
V_{bc} &= \sqrt{3}V_{N}\angle -90 \degree  \\
V_{ca} &= \sqrt{3}V_{N}\angle 150 \degree 
\end{align}
$$

Permutation relation:
![alt text](/assets/3phase2.png)

In balance load, derive **phase current** in **Y connected load**:
![alt text](/assets/3phase3.png)

In balance load, derive **line current** in **$\triangle$ connected load**
![alt text](/assets/3phase4.png)

In balance load, derive **phase current** in **$\triangle$ connected load**
![alt text](/assets/3phase5.png)

You see that for Line current:
in Y-connected load:
$$
I_{Y} \propto V_{LN}
$$

in $\triangle$-connected load:
$$
I_{\triangle} \propto 3V_{LN}
$$

thus if $I_{Y} = I_{\triangle} $:
$$
Z_{Y}  = \frac{Z_{\triangle}}{3}
$$

For power:
$$
\text{shift every by phase} \\
p \propto VI^{*} = V_{LN}I_{L}\angle(\delta+\phi-(\beta + \phi)) \\
p_{3\phi} = 3V_{LN}I_{L}cos(\delta-\beta) + j3V_{LN}I_{L}sin(\delta-\beta) \\
$$

constant real power!

![alt text](/assets/3phase6.png)
![alt text](/assets/3phase7.png)

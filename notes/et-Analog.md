## Transistor

For a small signal $\widetilde{v_{be}}$ gives:
$$
v_{be} = V_{be} + \widetilde{v_{be}} \\
i_c = I_se^{v_{be}/V_T} = I_se^{(V_{be} + \widetilde{v_{be}})/V_T} = I_ce^{ \widetilde{v_{be}} /V_T}
$$

We suppose a linear approximation which is the presumption.

$$
i_c = I_c(1 + \widetilde{v_{be}}/V_T) \\
\widetilde{i_c} = I_c \widetilde{v_{be}}/V_T = g_m\widetilde{v_{be}}
$$

Based on this and static point, we get:
$$
\widetilde{i_b} = \frac{1}{\beta}\widetilde{i_c} \\
\widetilde{i_e} = \frac{\beta+1}{\beta}\widetilde{i_c} \approx \widetilde{i_c} \\
$$

We define $r_\pi = \widetilde{v_{be}}/i_b$ Then:
$$
r_\pi = \frac{\beta}{g_m} = \frac{V_T}{I_b} \\
r_e = \frac{\widetilde{v_{be}}}{i_e} = \frac{\beta+1}{\beta g_m} \approx \frac{1}{g_m} \\
r_\pi = (\beta+1)r_e \approx \beta r_e
$$

Which is the internal impedance of transistor. Usually we approximate in daily temperature and yields $r_e = \frac{26\text{mV}}{I_e}$

![alt text](/md/assets/transistor1.png)

## MOSFET

![](/md/assets/mosfet1.png)

$V_{TN}$ is the truncated voltage to set the channel.

The charge between $x$ to $x + dx$ is given by:

$$
V_{Gx} = V_{GS} + V_{Sx} = V_{GS} - V(x) \\
dQ(x) = C_{0x}W(V_{GS} - V(x) - V_{TN})dx \\
I(x) = C_{0x}W(V_{GS} - V(x) - V_{TN})v_{0x} \\
v_{0x} \sim \sigma E(x) = -\sigma \frac{dV(x)}{dx} \\
\int_0^L I(x) dx = \sigma C_{0x} W \int_0^{V_{DS}}(V_{GS}-V(x)-V_{TN})dV(x) \\
I_{D} = \sigma C_{0x} \frac{W}{L}(V_{GS}-V_{TN}-V_{DS}/2)V_{DS} \\
$$

For saturation state: $V_{DS} < V_{GS}-V_{TN}$

$$
r_\pi = \frac{V_{DS}}{I_{D}} \approx \sigma C_{0x} \frac{W}{L}(V_{GS}-V_{TN})V_{DS} = k(...)
$$

which is linear.

For pitch-off state: $V_{DS} > V_{GS}-V_{TN}$, It will stuck at equal to get a fully saturation.
$$
I_{D} = \frac{k}{2}(V_{GS}-V_{TN})^2 \\
= I_{DSS}(\frac{V_{GS}}{V_{TN}}-1)^2
$$

We could construct same relation between $V_{GS}$ and $I_D$
$$
\begin{align}
g_m &= \frac{dI_{D}}{dV_{GS}} \\
&= I_{DSS}2(\frac{V_{GS}}{V_{TN}}-1)(-\frac{1}{V_{TN}}) \\
&= \frac{2I_{DSS}}{V_{TN}}(\frac{V_{GS}}{V_{TN}}-1) \\
&= g_{mo}(1-\frac{V_{GS}}{V_{TN}}) \\
r_d &= \frac{dV_{GS}}{dI_D} \\
\end{align}
$$

Now we conclude the final model.

![alt text](/md/assets/mosfet2.png)








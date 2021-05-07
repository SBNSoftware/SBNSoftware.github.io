

# MI-12

DIO CH 5 (Input software 4) : gated BES\
DIO CH 2 (Input software 1) : \$1D\
DIO CH 4 (Input software 3) : BNB RWM

**gatedBES**\
./wr-dio-cmd wr0 mode 4 I\
./wr-dio-ruler wr0 IN4 L2+0.001 R4+0.000335 &\
gets input from IN4, displays signal on local L2, sends signal to remote
R4 with a delay of 335 microseconds

**\$1D**\
./wr-dio-cmd wr0 mode 1 I\
./wr-dio-ruler wr0 IN1 L3+0.001 R1+0.0347 &\
gets input from IN1, displays signal on local L3, sends signal to remote
R1 with a delay of 34.7 ms (milliseconds)

**BNB RWM** still to be implemented:\
./wr-dio-cmd wr0 mode 3 I\
./wr-dio-ruler wr0 IN3 R3+0.000002 &\
gets input from IN3, and send signal to remore R3 with a delay of only 2
microseconds (neutrino\'s TOF )

::: 
[Edit this
section](_Current_beam_signals_settings_/edit?section=2){.icon-only
.icon-edit}
:::



# MI-60

DIO CH 5 (Input software 4) : MIBS \$74\
DIO CH 2 (Input software 1) : \$AE\
DIO CH 4 (Input software 3) : NuMI RWM

sending od these signals still to be implemented
:::

Files (0)

::: {style="display: none;"}
::: 
::: {.box}
[ [ ]{.attachments_fields} [ (Maximum size: 400 MB) ]{.add_attachment
style=""} ]{.attachments_form}
:::
:::
:::

Also available in:
[PDF](_Current_beam_signals_settings_.pdf){.pdf}
[HTML](_Current_beam_signals_settings_.html){.html}
[TXT](_Current_beam_signals_settings_.txt){.txt}

::: {style="clear:both;"}
:::
:::
:::
:::

::: 
Loading\...
:::

::: 
:::

::: 
::: {.bgl}
::: {.bgr}
Powered by [Redmine](https://www.redmine.org/) © 2006-2019 Jean-Philippe
Lang
:::
:::
:::
:::
:::

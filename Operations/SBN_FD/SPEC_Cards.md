

# SPEC Cards

The following commands may be executed while running the spec-vuart\
application, connected to a give SPEC card.

To create and add to the SPEC card\'s SFP database:

      sfp erase
      sfp add SFP-BX1310-10 180707 148323 72169888
      sfp add AXGE-1254-0531 180707 148323 72169888
      sfp add SFP-BX-1490-10 180707 148323 -73685416
      sfp add AXGE-3454-0531 180707 148323 -73685416
      sfp show

To create an initialization script

      init erase
      init add ptp stop
      init add sfp detect
      init add sfp match
      init add mode slave
      init add ptp start
      init show

To execute the initialization script

      init boot

To run the White Rabbit Timing Status display:

      gui

Type \"esc\" to exit the gui.

Type \"ctrl-a\" to exit spec-vuart
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
[PDF](SPEC_Cards.pdf){.pdf}
[HTML](SPEC_Cards.html){.html}
[TXT](SPEC_Cards.txt){.txt}

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

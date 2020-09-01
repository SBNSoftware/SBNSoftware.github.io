---
layout: page
title: SBN Production wiki
subtitle: Wiki for SBN Production
description: Wiki for the SBN Production Team
hero_height: is-medium
# menubar: sbnprod_menu
toc: true
toc_title: SBN Production Contents
---



SBN Production Page!
==========================================

This is version 0 of a wiki page for the SBN Production
It should have more than a passing familiarity with 



Contributing to this wiki
--------------------------

The content of this wiki is tracked in a GitHub repository [SBNSoftware/SBNSoftware.github.io](https://github.com/SBNSoftware/SBNSoftware.github.io)

<div id="text"></div>
 
<script>
document.getElementById("text").innerHTML = "Text added by JavaScript code";
</script>


<div id="surveyContainer"></div>

Survey.StylesManager.applyTheme("bootstrap");

var surveyJSON = {"pages":[{"name":"page1","elements":[{"type":"text","name":"question6","title":"Name/tag of the request"},{"type":"text","name":"question5","title":" Contact person (in case of issues/questions during the production) "},{"type":"text","name":"question4","title":"Deadline/priority"},{"type":"text","name":"question3","title":"Code release version"},{"type":"text","name":"question2","title":"Stage(s) of processing chain to run (workflow) (e.g. gen->g4->detsim-> etc.)"},{"type":"text","name":"question1","title":"Total number of events to produce"},{"type":"text","name":"question10","title":"Average number of events per output file or average output file size"},{"type":"text","name":"question9","title":"fcl file(s) to run"},{"type":"text","name":"question8","title":"Location of any input files, if needed"},{"type":"text","name":"question7","title":"Input dataset, if any"},{"type":"text","name":"question11","title":"Has the workflow been tested?"}],"title":"SBN Production Request Form","description":"here's how you ask for Production work"}]}

function sendDataToServer(survey) {
    //send Ajax request to your web server.
    alert("The results are:" + JSON.stringify(survey.data));
}

var survey = new Survey.Model(surveyJSON);
$("#surveyContainer").Survey({
    model: survey,
    onComplete: sendDataToServer
});

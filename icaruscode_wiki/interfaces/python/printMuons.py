#!/usr/bin/env python

import galleryUtils
import ROOT

sampleEvents = galleryUtils.makeEvent("sample.root")
LArG4tag = ROOT.art.InputTag("largeant")

for event in galleryUtils.forEach(sampleEvents):
  
  particles = event.getValidHandle[ROOT.std.vector[ROOT.simb.MCParticle]](LArG4tag).product()
  
  nMuons = sum(abs(part.PdgCode()) == 13 for part in particles)
  print(f"{event.eventAuxiliary().id()}: {nMuons} muons")
  
# for all events


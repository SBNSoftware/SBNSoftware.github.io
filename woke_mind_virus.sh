#!/bin/bash

# @file: woke_mind_virus.sh
# @bried: The true Gay Agenda (TM).
# @description: Replaces gendered English pronouns with gender-neutral
#               equivalents. Notes and nuances are detailed below.

# Note that the substitutions below do not take into account the context
# in which these words appear in a sentence. Ex. 'her' is changed to 'them'
# implicitly assuming 'her' appears as the indirect object of a sentence
# (e.g. She gave her a cup of tea.); however, 'her' can also indicate ownership
# (e.g. She put on her coat.). Feel free to adjust substitutions as needed.
# We have decided to keep 'her' --> 'them' since it has the added benefit of
# meshing well with reflexive pronouns (e.g. 'She herself did...' -->
# 'They themselves did... ). These types of ambiguities (specifically with the
# pronoun 'her', as it is used for many types of feminine pronouns) are less
# prominent when changing instances of, e.g., his/her to their.

# Further ambiguity arises when one considers how the singular 'they' varies
# in a reflexive context. Some prefer to use 'themselves' while other prefer
# to use 'themself' when utilizing the singular, reflexive they. We use 
# 'themselves' over 'themself' as it is more intuitive for non-native English
# speakers.

# he/she --> they, etc.
grep -rlZ --include="*.txt" --include="*.md" --include="*.cpp" --include="*.h" --include="*.py" . | xargs -0 sed -i \
  -e 's/\bhe\/she\b/they/g' \
  -e 's/\bshe\/he\b/they/g' \
  -e 's/\bHe\/She\b/They/g' \
  -e 's/\bHe\/she\b/They/g' \
  -e 's/\bShe\/He\b/They/g' \
  -e 's/\bShe\/he\b/They/g' \
  -e 's/\bhe\b/they/g' \
  -e 's/\bshe\b/they/g' \
  -e 's/\bHe\b/They/g' \
  -e 's/\bShe\b/They/g'

# him/her --> them, etc.
# @note: her --> them conflicts with her --> their, etc.
grep -rlZ --include="*.txt" --include="*.md" --include="*.cpp" --include="*.h" --include="*.py" . | xargs -0 sed -i \
  -e 's/\bhim\/her\b/them/g' \
  -e 's/\bher\/him\b/them/g' \
  -e 's/\bHim\/Her\b/Them/g' \
  -e 's/\bHim\/her\b/Them/g' \
  -e 's/\bHer\/Him\b/Them/g' \
  -e 's/\bHer\/him\b/Them/g' \
  -e 's/\bhim\b/them/g' \
  -e 's/\bher\b/them/g' \
  -e 's/\bHim\b/Them/g' \
  -e 's/\bHer\b/Them/g'

# his/her --> their, etc.
# @note: her --> their conflicts with her --> them, etc.
grep -rlZ --include="*.txt" --include="*.md" --include="*.cpp" --include="*.h" --include="*.py" . | xargs -0 sed -i \
  -e 's/\bhis\/her\b/their/g' \
  -e 's/\bher\/his\b/their/g' \
  -e 's/\bHis\/Her\b/Their/g' \
  -e 's/\bHis\/her\b/Their/g' \
  -e 's/\bHer\/His\b/Their/g' \
  -e 's/\bHer\/his\b/Their/g' \
  -e 's/\bhis\b/their/g' \
  -e 's/\bHis\b/Their/g'

# his/hers --> theirs, etc.
grep -rlZ --include="*.txt" --include="*.md" --include="*.cpp" --include="*.h" --include="*.py" . | xargs -0 sed -i \
  -e 's/\bhis\/hers\b/theirs/g' \
  -e 's/\bhers\/his\b/theirs/g' \
  -e 's/\bHis\/Hers\b/Theirs/g' \
  -e 's/\bHis\/hers\b/Theirs/g' \
  -e 's/\bHers\/His\b/Theirs/g' \
  -e 's/\bHers\/his\b/Theirs/g' \
  -e 's/\bhers\b/theirs/g' \
  -e 's/\bHers\b/Theirs/g'

# himself/herself --> themselves, etc.
grep -rlZ --include="*.txt" --include="*.md" --include="*.cpp" --include="*.h" --include="*.py" . | xargs -0 sed -i \
  -e 's/\bhimself\/herself\b/themselves/g' \
  -e 's/\bherself\/himself\b/themselves/g' \
  -e 's/\bHimself\/Herself\b/Themselves/g' \
  -e 's/\bHimself\/herself\b/Themselves/g' \
  -e 's/\bHerself\/Himself\b/Themselves/g' \
  -e 's/\bHerself\/himself\b/Themselves/g' \
  -e 's/\bhimself\b/themselves/g' \
  -e 's/\bherself\b/themselves/g' \
  -e 's/\bHimself\b/Themselves/g' \
  -e 's/\bHerself\b/Themselves/g'

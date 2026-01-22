---
title: "Vers l'explication du comportement d'agents IA éthiquement alignés"
slug: gt-ace-2026

event: Journées MAFTEC SMAA ACE 2026

location: I-Factory, Lyon, France

summary: A seminar talk about the need for explicability in ethics, the lack of explaining the reward function in most Explainable RL works, and the proposal to use abstract argumentation to construct and explain reward functions for moral values.

abstract: >
  The emerging field of computational ethics aims to produce computer systems capable of making decisions that are aligned with the moral values of stakeholders (users, designers, and more generally human society as a whole). Various techniques are proposed, including symbolic techniques, which allow the implementation of ethical principles identified in moral philosophy literature, and learning techniques, which allow an agent to learn behavior through trial and error. Among these techniques, reinforcement learning is often considered an appropriate method because it allows for a sequence of actions to be taken into account. However, this requires the definition of a reward function that guides the agent toward the “right” actions, relative to the moral values that one wishes to promote. This function is difficult to define in the context of ethics because it is based on moral concepts. System designers must also be wary of reward hacking, which is the tendency of agents to learn behaviors that optimize the reward function, but in an unintended and often undesirable way. For example, by endlessly collecting bonuses that earn points, but never crossing the finish line in a boat race.
  I will present the ECIEA project - Explanation of the Behavior of Ethically Aligned AI Agents, in which we propose to define the reward function through argumentation theory. This approach offers a twofold advantage: 1) it allows, through a knowledge engineering approach, the reward function to be constructed in relation to the expert knowledge of stakeholders, including these stakeholders in the process, rather than relying solely on AI experts; and 2) it explains the rewards obtained by the agent during its learning process, making it possible to detect and correct reward hacking.
  I will then present preliminary work, which consisted of implementing the Ethical Gardeners environment, on which the methods developed in the ECIEA project will be evaluated. This environment represents a world of squares in which gardener agents must plant and collect flowers. We propose using sustainable development goals as test “ethical values”; these goals are partially conflicting, thus reproducing the complexity of pluralistic and incommensurable morality. This environment, although still in beta, is available as open source.

# Talk start and end times.
#   End time can optionally be hidden by prefixing the line with `#`.
date: '2026-01-23T10:45:00Z'
date_end: '2026-01-23T11:10:00Z'
all_day: false

# Schedule page publish date (NOT talk date).
publishDate: '2026-01-22T00:00:00Z'

authors: ["Rémy Chaput"]
profile: false
tags: []

# Is this a featured talk? (true/false)
featured: false

# url: ""
# url_code: "source/"
# url_pdf: "Machine_Ethics_and_Normative_Systems.pdf"
url_slides: "GT-ACE-2026-Chaput.pdf"
# url_video: ""
---

A talk that I gave (in French) at a seminar of the GT ACE -- a national workgroup on Computational Aspects of Ethics,
about the need for explainability in ethics, the lack of explaining the reward function, and the proposal to use abstract argumentation to construct and explain the reward function.

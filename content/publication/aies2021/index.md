+++
title = "A Multi-Agent Approach to Combine Reasoning and Learning for an Ethical Behavior"
date = 2021-05-21
authors = ["Rémy Chaput", "Jérémy Duval", "Olivier Boissier", "Mathieu Guillermin", "Salima Hassas"]
profile = false

publication_types = ["1"]
publication = "*Fourth AAAI/ACM Conference on Artificial Intelligence, Ethics, and Society - A virtual conference, May 19-21, 2021*"
publication_short = "AIES21"

abstract = """
The recent field of Machine Ethics is experiencing rapid growth to
answer the societal need for Artificial Intelligence (AI) algorithms
imbued with ethical considerations, such as benevolence toward
human users and actors. Several approaches already exist for this
purpose, mostly either by reasoning over a set of predefined ethical
principles (Top-Down), or by learning new principles (Bottom-Up).
While both methods have their own advantages and drawbacks,
only few works have explored hybrid approaches, such as using
symbolic rules to guide the learning process for instance, combining
the advantages of each. This paper draws upon existing works
to propose a novel hybrid method using symbolic judging agents to
evaluate the ethics of learning agents’ behaviors, and accordingly
improve their ability to ethically behave in dynamic multi-agent environments.
Multiple benefits ensue from this separation between
judging and learning agents: agents can evolve (or be updated by
human designers) separately, benefiting from co-construction processes;
judging agents can act as accessible proxies for non-expert
human stakeholders or regulators; and finally, multiple points of
view (one per judging agent) can be adopted to judge the behavior of
the same agent, which produces a richer feedback. Our proposed approach
is applied to an energy distribution problem, in the context
of a Smart Grid simulator, with continuous and multi-dimensional
states and actions. The experiments and results show the ability of
learning agents to correctly adapt their behaviors to comply with
the judging agents’ rules, including when rules evolve over time.
"""

summary = """
Paper presented at the *AI, Ethics, and Society* conference. It presents a
novel, hybrid, method to learn \"ethical behaviors\" by combining symbolic
judgments with a Reinforcement Learning algorithm.
"""

tags = ["Ethics", "Machine Ethics", "Multi-Agent Learning", 
"Reinforcement Learning", "Hybrid Neural-Symbolic Learning", "Ethical Judgment"]
featured = false

url_poster = "Multi_Agent_Approach_Combine_Reasoning_Learning_Ethical_Behavior_poster.pdf"
url_slides = "Multi_Agent_Approach_Combine_Reasoning_Learning_Ethical_Behavior_slides.pdf"
url_pdf = "https://dl.acm.org/doi/10.1145/3461702.3462515"
+++

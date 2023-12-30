---
title: "ethical-smart-grid"
summary: "Smart Grid simulator for Reinforcement Learning focusing on ethical behaviours."
authors: ["rchaput"]
tags: ["Python", "reinforcement-learning", "Simulator", "smart-grid", "machine-ethics"]
categories: []
date: 2023-04-03

profile: false
 
external_link: ""

image:
  caption: "Schema of the Smart Grid elements"
  focal_point: ""
  preview_only: false

url_code: "https://github.com/ethicsai/ethical-smart-grid/"

links:
  - name: Documentation
    url: 'https://ethicsai.github.io/ethical-smart-grid/'
    icon_pack: fas
    icon: book
---

This is a third-party [Gym] environment, focusing on learning ethically-aligned
behaviours in a Smart Grid use-case.

A Smart Grid contains several *prosumer* (prosumer-consumer) agents that interact
in a shared environment by consuming and exchanging energy. These agents have
an energy need, at each time step, that they must satisfy by consuming energy.
However, they should respect a set of moral values as they do so, i.e.,
exhibiting an ethically-aligned behaviour.

Moral values are encoded in the reward functions, which determine the
"correctness" of an agent's action, with respect to these moral values. Agents
receive rewards as feedback that guide them towards a better behaviour.

[Gym]: https://gymnasium.farama.org/

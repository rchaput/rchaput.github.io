---
title: "ethical-gardeners"
summary: "Multi-agent gardening simulator for Reinforcement Learning focusing on ethical behaviours."
authors: ["rchaput"]
tags: ["Python", "reinforcement-learning", "Simulator", "smart-grid", "machine-ethics"]
categories: []
date: 2025-09-08

profile: false
 
external_link: ""

image:
  caption: "Schema of the Smart Grid elements"
  focal_point: ""
  preview_only: false

url_code: "https://github.com/ethicsai/ethical-gardeners/"

links:
  - name: Documentation
    url: 'https://ethicsai.github.io/ethical-gardeners/'
    icon_pack: fas
    icon: book
---

This is a third-party [PettingZoo] environment, focusing on learning 
ethically-aligned behaviours in a multi-agent gardening use-case.

Several agents must plant and harvest flowers in a gridworld garden, in order
to satisfy several objectives that are meant as proxies for moral values.
The goal is to show that, if these agents can learn the proxies, then they
should be able to learn moral values once we implement them in the system.

The current proxies are inspired from the Sustainable Development Goals, and
include: 1) gaining enough money to live comfortably, by harvesting and selling
flowers; 2) ensuring the pollution decreases in the environment by planting
flowers; 3) ensuring the diversity increases by keeping various species of
flowers.

[PettingZoo]: https://pettingzoo.farama.org/

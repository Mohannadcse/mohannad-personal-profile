---
layout: post
title: "Reviewing at S&P 2026: Papers, Patterns, and Lessons"
date: 2026-03-10
description: 20 papers, 2 acceptances, and a lot to learn about what separates accepted security research from rejected work.
tags: [peer-review, security-research, sp2026]
categories: research
related_posts: false
---

### TL;DR

I reviewed 20 papers across two cycles at IEEE S&P 2026 — only 2 were accepted. Many papers surfaced genuinely unknown vulnerabilities, yet were rejected because they read more like technical writeups than scientific papers. This post shares what I observed in case it is useful to authors.

{: .notice--info}

## Introduction

Serving on the program committee of a top security venue is one of the better ways to understand what separates accepted papers from rejected ones — not in the abstract, but in practice, paper by paper. This past cycle I had the opportunity to be on the PC for IEEE S&P 2026, and the experience left me with a lot to think about.

This is not my first time reviewing for a top-tier security conference — I have previously served as a reviewer for CCS and USENIX Security. But this cycle felt different in ways that reflect where security research is heading. A striking majority of the papers I reviewed used AI — LLMs in particular — as a core tool for discovering unknown vulnerabilities. That is a clear shift from what I observed in previous cycles.

Two things stood out enough that I felt compelled to write them down: why papers that found real vulnerabilities still got rejected, and how AI is reshaping the way vulnerability research is conducted.

Neither observation is meant as a critique of any individual paper or author. Security research is hard, and submitting to a top-4 venue takes courage. These are simply patterns worth naming.

## The Review Load

Over two review cycles, I reviewed a total of 20 papers:

- **Cycle 1:** 10 papers — 7 Round 1 (R1) and 3 Round 2 (R2)
- **Cycle 2:** 10 papers — 7 Round 1 (R1) and 3 Round 2 (R2)

Of those 20 papers, **only 2 were accepted** — a 10% rate across my personal batch.

For context, the overall conference acceptance rates were higher: Cycle 1 accepted 118 of 925 submissions (12.7%), and Cycle 2 accepted 135 of 1070 submissions (12.6%). My batch happened to be more competitive, but the broader picture is consistent: roughly 1 in 8 papers submitted to S&P makes it through. Experiencing that as a reviewer rather than as an author changes how you interpret it. Rejection at this rate is not a sign that the work is bad — it often means the work is good but incomplete in ways that matter.

## Observation 1: Discovering Unknown Vulnerabilities Is Not Enough

The finding that surprised me most: a large fraction of the papers I reviewed had discovered real, previously unknown vulnerabilities. In several cases, the technical work was genuinely impressive — the authors had done something nontrivial to identify exposures that had not been documented before.

And yet, most of those papers were rejected.

This is worth sitting with for a moment. The authors found something new. They found something real. And it still wasn't enough.

The reason, in almost every case, came down to framing. A vulnerability discovery is a **result** — it is not, by itself, a research contribution in the scientific sense. A paper needs to situate that result within a clear research question, a defined threat model, and a methodology rigorous enough that another researcher could scrutinize or reproduce it. Without that scaffolding, even a striking technical finding reads as a technical report rather than a scientific paper.

**The one exception** is instructive. One of the two accepted papers also read somewhat like a technical writeup — the scientific framing was thinner than I would have expected for S&P. But the vulnerabilities it described were so serious and so concretely impactful that the program committee judged them significant enough to accept anyway. Severity and real-world impact can, in exceptional cases, carry a paper across the threshold. But this is the exception, not the rule, and it is not a strategy to plan around.

{: .notice--warning}
Discovering an unknown vulnerability is a necessary but not sufficient condition for acceptance at a top security venue. The framing matters as much as the finding.

## Observation 2: Tech Writeup vs. Scientific Paper

The distinction between a technical writeup and a scientific paper is something that experienced researchers feel intuitively but rarely explain explicitly. Let me try.

A **technical writeup** describes what was done and what was found. It is organized around a workflow: here is the target, here is how we attacked it, here is what we discovered. It is often well-written and technically detailed. But it does not necessarily answer *why* — why this attack surface matters, why the methodology is sound, why the findings generalize.

A **scientific paper** does all of that, but it also defines the boundaries of its claims. It asks a precise research question, scopes the threat model carefully, explains the methodology in enough detail to be scrutinized, and discusses limitations honestly.

The papers I reviewed that fell into the "tech writeup" category were not poorly written — many were clearly the product of months of careful work. What they lacked was attention to the elements that make a paper defensible under peer review:

- **Threat model**: Who is the attacker? What do they know? What can they do? What are they trying to achieve? Many papers treated this as a formality rather than a foundation.
- **Research question**: What claim is the paper making, exactly? Is it a claim about prevalence, exploitability, impact, generalizability?
- **Methodology**: Why were these targets chosen? Why is this evaluation sufficient? What are the confounds?

{: .notice--info}
If you are writing a security paper and you find yourself describing your threat model in two vague sentences, stop. The threat model is the contract between you and your reader. It defines what your results mean and what they don't.

## Advice for Authors

Based on what I observed across these 20 papers, a few things stand out:

- **Treat the threat model as a first-class contribution.** Define your attacker clearly. Describe their capabilities and goals. Explain how your methodology is valid under that model. Revisit it in your evaluation and discussion sections.
- **Separate your research contribution from your engineering contribution.** Building a tool or identifying vulnerabilities is engineering. The research contribution is the claim your work makes about the world — about prevalence, exploitability, root cause, generalizability. Be explicit about what that claim is.
- **Dial back the hype.** Phrases like "first ever" and "novel" can feel like they strengthen a submission, but they do the opposite under scrutiny. They invite skepticism. Let your results speak; they are more persuasive than superlatives.

## Conclusion

Reviewing 20 papers across two cycles is a significant investment, and I came away from it with a lot of respect for the authors — security research is hard, and submitting to a competitive venue takes real effort. But it also clarified something I had heard before but not fully internalized: *technical excellence and scientific rigor are not the same thing*, and top venues expect both.

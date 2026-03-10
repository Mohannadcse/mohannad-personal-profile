---
layout: single
title: "Reviewing at S&P 2026: Papers, Patterns, and LLMs"
date: 2026-03-10
categories: [Security, Peer Review, AI]
tags: [sp2026, peer-review, llm, chatgpt, gemini, security-research]
excerpt: "20 papers, 2 acceptances, and a lot to learn about scientific writing — and about LLMs."
header:
  overlay_color: "#333"
toc: true
toc_label: "Contents"
toc_icon: "list"
classes: wide
---

### TL;DR

I reviewed 20 papers across two cycles at IEEE S&P 2026 — only 2 were accepted. Many papers surfaced genuinely unknown vulnerabilities, yet were rejected because they read more like technical writeups than scientific papers. I also used LLMs (ChatGPT and Gemini) throughout the review process and came away with clear takeaways: LLMs lean toward acceptance, get misled by author hype, overlook threat model gaps, and drift from your stated concerns when drafting responses. This post shares both sets of observations in case they are useful to authors and to anyone else experimenting with LLMs in the review loop.
{: .notice--info}

## Introduction

Serving on the program committee of a top security venue is one of the better ways to understand what separates accepted papers from rejected ones — not in the abstract, but in practice, paper by paper. This past cycle I had the opportunity to be on the PC for IEEE S&P 2026, and the experience left me with a lot to think about.

This is not my first time reviewing for a top-tier security conference — I have previously served as a reviewer for CCS and USENIX Security. But this cycle felt different in ways that reflect where security research is heading. A striking majority of the papers I reviewed used AI — LLMs in particular — as a core tool for discovering unknown vulnerabilities. That is a clear shift from what I observed in previous cycles. On my end, I also used LLMs as assistants throughout the review process, which taught me something about how these tools behave when put to that task.

Three things stood out enough that I felt compelled to write them down: why papers that found real vulnerabilities still got rejected, how AI is reshaping the way vulnerability research is conducted, and what I learned from using LLMs to assist with my own reviews.

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

## My LLM-Assisted Review Workflow

For every paper in this review cycle, I ran the following workflow:

1. **Read the paper myself** and form my own assessment — verdict, main strengths, main concerns.
2. **Ask an LLM (ChatGPT or Gemini) to review the same paper** — independently, without revealing my take.
3. **Sometimes cross-check across both LLMs**, particularly when I wanted to see if a concern I had was shared or just my own read.
4. **Ask the LLM to draft the written review response**, starting from my stated verdict and concerns.

The goal was to use LLMs to catch blind spots, stress-test my reasoning, and speed up the drafting process. The results were instructive — and not entirely in the way I expected.

## What I Learned About LLMs in Peer Review

### 1. LLMs Lean Toward Acceptance

The most consistent pattern: LLMs are lenient. Even when I explicitly told the model that I had decided to reject a paper and explained my specific concerns, the LLM-generated review often softened the rejection or framed concerns as suggestions for revision rather than fundamental issues.

This is not a minor calibration issue. At a venue like S&P, the difference between "this is a weak accept" and "this is a strong reject" is meaningful. An LLM that defaults toward encouragement is not aligned with the hard evaluation standards that top venues require.

If you are using an LLM to help calibrate your review, be aware that it will pull your verdict toward acceptance. You need to be deliberate about anchoring your own judgment before you ask for its input.

### 2. LLMs Are Misled by Author Hype

Security papers frequently contain phrases like *"to the best of our knowledge, this is the first work to..."* or *"our novel approach..."* or *"this is a unique contribution..."*. These phrases are conventions — sometimes accurate, sometimes not — and experienced reviewers learn to read past them and evaluate the actual claims.

LLMs do not always do this. I noticed the LLM would often echo it back in its review, treating novelty claims as established facts rather than assertions to be verified. The LLM was being guided by the paper's framing rather than questioning it.

{: .notice--warning}
An LLM reviewing a paper is reading it much like a first-time reader would. It can be nudged by confident, assertive writing in ways that a domain expert would not be.

### 3. LLMs Overlook the Threat Model

This one aligned with my broader observation about the papers themselves. Just as many authors gave the threat model insufficient attention, the LLMs reviewing those papers gave it insufficient attention too.

In security research, the threat model is the lens through which every other claim must be evaluated. If the threat model is vague or internally inconsistent, then the claimed results may not mean what the authors think they mean. I consistently had to prompt the LLM explicitly — "evaluate the threat model" — to get it to engage with this aspect of the paper. Left to its own devices, it would focus on the technical contributions and treat the threat model as background.

### 4. LLM-Drafted Responses Drift

This was the most practically important finding for my workflow. When I asked an LLM to draft the written review response based on my stated verdict and concerns, the resulting text often drifted — not dramatically, but enough to matter.

The drift took a few forms:
- Key concerns I had raised were buried or softened
- The LLM would introduce framings I had not asked for
- The overall tone sometimes shifted away from the stance I had taken
- Specific technical details I had identified were occasionally paraphrased in ways that lost precision

The takeaway is not to stop using LLMs for drafting — they can genuinely save time and produce a fluent starting point. The takeaway is to **always re-read the draft carefully before submitting**. Treat it as a first draft that needs to be brought back into alignment with your actual review.

## Advice for Authors

Based on what I observed across these 20 papers, a few things stand out:

- **Treat the threat model as a first-class contribution.** Define your attacker clearly. Describe their capabilities and goals. Explain how your methodology is valid under that model. Revisit it in your evaluation and discussion sections.
- **Separate your research contribution from your engineering contribution.** Building a tool or identifying vulnerabilities is engineering. The research contribution is the claim your work makes about the world — about prevalence, exploitability, root cause, generalizability. Be explicit about what that claim is.
- **Dial back the hype.** Phrases like "first ever" and "novel" can feel like they strengthen a submission, but they do the opposite under scrutiny. They invite skepticism. Let your results speak; they are more persuasive than superlatives.

## Advice for Reviewers Using LLMs

If you are experimenting with LLMs in your review workflow, these are the practices I found most important:

- **Form your own verdict first, every time.** Read the paper, reach a conclusion, and note your main concerns before you involve an LLM. This protects your judgment from the LLM's acceptance bias.
- **Be explicit about your decision and concerns when prompting.** Do not ask the LLM "what do you think of this paper?" Ask it to review the paper given that you have decided to reject it for reasons X, Y, and Z, and to assess whether those concerns are well-founded.
- **Cross-check two LLMs for important papers.** Where the two models diverge is often where the paper is doing something interesting or where the evaluation is genuinely uncertain.
- **Re-read every LLM-drafted response before submitting.** The draft will drift. Your job is to bring it back to what you actually think. Think of it as a co-author who writes fluently but needs editorial direction.

## Conclusion

Reviewing 20 papers across two cycles is a significant investment, and I came away from it with a lot of respect for the authors — security research is hard, and submitting to a competitive venue takes real effort. But it also clarified something I had heard before but not fully internalized: *technical excellence and scientific rigor are not the same thing*, and top venues expect both.

The LLM experiment ran in parallel was an unexpected source of insight. The limitations I observed — acceptance bias, susceptibility to hype, inattention to threat models, and response drift — are not reasons to avoid using LLMs in the review process. They are reasons to use them deliberately, with your own judgment as the anchor.

Peer review is still, fundamentally, a human activity. The best use of AI in this loop is to sharpen your thinking, not to replace it.

---
name: UPSC AI Modern Design System
description: Clean, high-precision contemporary exam platform and 30-year PYQ archive for serious civil services aspirants
colors:
  primary: "#1E1B4B"
  primary-deep: "#0F172A"
  primary-tint: "#EEF2FF"
  primary-border: "#312E81"
  primary-dark-mode: "#4F46E5"
  primary-dark-mode-border: "#6366F1"
  accent-saffron: "#EA580C"
  accent-saffron-light: "#F97316"
  accent-saffron-tint: "#FFF7ED"
  accent-blue: "#2563EB"
  accent-blue-tint: "#EFF6FF"
  secondary: "#0D9488"
  secondary-dim: "#0F766E"
  neutral-bg: "#FAFAFA"
  neutral-surface: "#FFFFFF"
  neutral-subtle: "#F1F5F9"
  neutral-dark-bg: "#0B0D17"
  neutral-dark-surface: "#151829"
  neutral-dark-subtle: "#1E2238"
  text-primary: "#0F172A"
  text-secondary: "#475569"
  text-muted: "#64748B"
  text-dark-primary: "#F8FAFC"
  text-dark-secondary: "#94A3B8"
  border: "#E2E8F0"
  border-subtle: "#F1F5F9"
  border-dark: "#262B47"
  status-answered: "#10B981"
  status-unanswered: "#EF4444"
  status-review: "#7C3AED"
  status-highlight: "#EA580C"
typography:
  display:
    fontFamily: "DM Sans, system-ui, sans-serif"
    fontSize: "2.5rem"
    fontWeight: 800
    lineHeight: 1.15
    letterSpacing: "-0.03em"
  headline:
    fontFamily: "DM Sans, system-ui, sans-serif"
    fontSize: "1.5rem"
    fontWeight: 700
    lineHeight: 1.3
    letterSpacing: "-0.02em"
  body:
    fontFamily: "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
    fontSize: "1rem"
    fontWeight: 400
    lineHeight: 1.65
    letterSpacing: "0em"
  devanagari:
    fontFamily: "'Noto Sans Devanagari', 'DM Sans', sans-serif"
    fontSize: "1.0625rem"
    fontWeight: 400
    lineHeight: 1.75
  kannada:
    fontFamily: "'Noto Sans Kannada', sans-serif"
    fontSize: "1.0625rem"
    fontWeight: 400
    lineHeight: 1.75
  mono:
    fontFamily: "ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace"
    fontSize: "0.875rem"
    fontWeight: 500
rounded:
  sm: "6px"
  md: "8px"
  lg: "12px"
  xl: "16px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "16px"
  lg: "24px"
  xl: "32px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "#FFFFFF"
    rounded: "{rounded.md}"
    padding: "10px 20px"
  button-primary-hover:
    backgroundColor: "{colors.primary-deep}"
  card-modern:
    backgroundColor: "{colors.neutral-surface}"
    textColor: "{colors.text-primary}"
    rounded: "{rounded.lg}"
    padding: "24px"
  badge-pill:
    backgroundColor: "{colors.primary-tint}"
    textColor: "{colors.primary}"
    rounded: "{rounded.sm}"
    padding: "4px 10px"
---

# Design System

<!-- impeccable:design-schema 1 -->

## Overview

UPSC AI employs a **Modern Technical Precision** aesthetic articulated through the **Midnight Indigo & Saffron Spark** palette. Rejecting both retro harsh borders and generic tech templates, the design combines the constitutional authority and intellectual rigor of India's civil services with the high-productivity precision of modern software (Linear, Raycast).

The system pairs sovereign Midnight Indigo (`#1E1B4B`) and Lapis Blue (`#2563EB`) with the motivational energy of Tri-Color Saffron (`#EA580C` / `#F97316`). The canvas rests on an ultra-clean neutral (`#FAFAFA`) in light mode and deep midnight obsidian (`#0B0D17`) in dark mode, framed by whisper-soft borders (`#E2E8F0`), smooth multi-stop ambient drop shadows, and refined rounded geometry (`8px`, `12px`, `16px`).

## Colors: Midnight Indigo & Saffron Spark

### Canvas & Surfaces
- **Light Primary Canvas**: `#FAFAFA` — Ultra-clean, distraction-free neutral backdrop.
- **Card & Workspace Surface**: `#FFFFFF` — Pure white surface offering crisp contrast (> 13:1).
- **Secondary / Sub-surface**: `#F1F5F9` — Subtle boundary layer for side panels, question palettes, and toolbars.
- **Dark Canvas**: `#0B0D17` — Deep midnight obsidian tone for nocturnal study marathons.
- **Dark Surface**: `#151829` — Elevated midnight indigo card surface.
- **Dark Sub-surface**: `#1E2238` — Container and palette boundaries.

### Typography & Content
- **Text Primary**: `#0F172A` (slate-900) — Deep charcoal ensuring maximum legibility.
- **Text Secondary**: `#475569` (slate-600) — Metadata, question categories, and timestamps.
- **Text Muted**: `#64748B` (slate-500) — Non-critical hints, shortcuts, and counters.

### Brand & Interactive Accents
- **Sovereign Indigo**: `#1E1B4B` — Primary brand tone representing constitutional dignity and executive authority.
- **Indigo Border**: `#312E81` — 1px edge on indigo primary buttons and the logo tile, so the fill reads as a raised control.
- **Dark-mode Primary**: `#4F46E5` fill with `#6366F1` border — replaces Sovereign Indigo on dark surfaces, where `#1E1B4B` disappears against `#151829`.
- **Saffron Spark (Accent)**: `#EA580C` (hover `#C2410C`, tint `#FFF7ED`) — High-energy courage, streak flame, active state highlight, and brand emblem spark.
- **Lapis Blue (Interactive Action)**: `#2563EB` (hover `#1D4ED8`, tint `#EFF6FF`) — Interactive controls, active question navigation, and focus rings.
- **Secondary Teal**: `#0D9488` — Performance metrics and syllabus domain tags.

### Exam CBT Semantic Status
- **Answered / Success**: `#10B981` (Emerald) — Candidate response recorded.
- **Unanswered / Error**: `#EF4444` (Rose Crimson) — Visited but unattempted, or incorrect answer in review.
- **Review / Bookmark**: `#7C3AED` (Royal Violet) — Marked for review.
- **Highlight / Active / Streak**: `#EA580C` / `#F59E0B` (Saffron Gold) — Active question focus ring and persistence streaks.

## Typography

- **Headlines & Display**: `DM Sans`, geometric and contemporary with clear numerals and `-0.025em` tracking.
- **Question Body & Statements**: Clean, highly readable system font stack with generous `lineHeight: 1.65` to make multi-line assertions easy to scan.
- **Hindi / Devanagari Script**: `Noto Sans Devanagari` scaled to `106%` font size with `lineHeight: 1.75` to balance visual weight with Latin text.
- **Equations & Formal Logic**: KaTeX math rendering, integrated inline or centered for CSAT reasoning and statistics.

## Layout

- **Strict Vertical Rhythm**: Systematic 8px baseline grid (`8px`, `16px`, `24px`, `32px`).
- **Maximum Reading Line Length**: Question bodies constrained to `72ch` (characters) max to prevent eye fatigue across wide desktop displays.
- **Modern Sticky Navbar**: Glassmorphic backdrop blur (`backdrop-filter: blur(12px); background: rgba(255,255,255,0.85);`) with subtle bottom border (`#E2E8F0`).
- **Dual Pane CBT Desktop Layout**: 
  - Left pane (72%): Question statement, passage, options, and action controls.
  - Right pane (28%): Question palette grid, time remaining countdown, and section jumper.

## Elevation & Depth

- **Smooth Ambient Multi-Stop Shadows**: Soft, diffused modern shadows replacing harsh offset borders.
  - `--shadow-sm`: `0 1px 2px 0 rgba(0, 0, 0, 0.05)`
  - `--shadow-card`: `0 1px 3px 0 rgba(0, 0, 0, 0.06), 0 1px 2px -1px rgba(0, 0, 0, 0.04)`
  - `--shadow-card-hover`: `0 10px 20px -3px rgba(0, 0, 0, 0.07), 0 4px 6px -4px rgba(0, 0, 0, 0.03)`
  - `--shadow-lg`: `0 20px 25px -5px rgba(0, 0, 0, 0.08), 0 8px 10px -6px rgba(0, 0, 0, 0.02)`
- **Tonal Layering**: Containers use subtle border boundaries (`#E2E8F0` in light mode, `#1E293B` in dark mode) paired with clean solid fills.

## Shapes

- **Modern Rounded Scale**:
  - Micro badges, status dots, and keyboard keys: `6px` (`--radius-sm`)
  - Buttons and inputs: `8px` (`--radius`)
  - Option cards and panels: `12px` (`--radius-lg`)
  - Large feature containers and modals: `16px` (`--radius-xl`)
  - Pill badges and avatar tags: `9999px` (`rounded-full`)

## Components

### 1. Modern Question Card
- High-contrast pure white container with subtle `1px solid #E2E8F0` border and soft ambient shadow.
- Clean assertion numbering (`1.`, `2.`, `(a)`, `(b)`).
- Distinct option selection state: subtle blue tint (`#EFF6FF`), solid blue border (`#2563EB`), smooth radio ring indicator.

### 2. Modern Navigation Matrix
- Compact number grid (1–100 for GS, 1–80 for CSAT).
- Smooth rounded chips (`6px` radius).
- Distinct status color fill per question state (Answered, Marked for Review, Not Visited).

## Do's and Don'ts

### Do's
- **Do** use subtle, soft borders (`1px solid #E2E8F0`) and diffused multi-stop shadows.
- **Do** maintain high contrast (> 4.5:1 for body, > 3:1 for large text) in both Light and Dark themes.
- **Do** provide smooth transitions (`transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1)`) on interactive controls.
- **Do** treat keyboard navigation as a first-class feature for CBT testing.

### Don'ts
- **Don't** use harsh 90s-style solid offset shadows (`2px 2px 0px #1E1E1E`).
- **Don't** use thick black outlines (`1.5px solid #1E1E1E`) on white cards.
- **Don't** use yellow retro badges (`#FEF08A` with black borders); use subtle refined tints instead.
- **Don't** use decorative rainbow text gradients (`background-clip: text`) on headings or numbers.

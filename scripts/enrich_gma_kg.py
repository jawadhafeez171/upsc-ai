# -*- coding: utf-8 -*-
"""
Enrich General Mental Ability Knowledge Graph
---------------------------------------------
Adds granular Level-4 Subtopics across Topics of 
General Mental Ability, Quantitative Aptitude & Comprehension.

- Reading Comprehension topic has NO children (remains a unified leaf topic).
- Simple Interest and Compound Interest are split into two distinct subtopic nodes.
- Data Interpretation & Data Sufficiency is expanded into 9 distinct granular subtopics
  including Venn Diagram-based DI, missing data tables, and distinct chart formats.
"""

import json
import os
import re

SUBTOPICS = [
    # -------------------------------------------------------------
    # (Topic 1: reading_comprehension_inference has NO children as requested)
    # -------------------------------------------------------------

    # -------------------------------------------------------------
    # Topic 2: critical_reasoning_analytical_ability
    # -------------------------------------------------------------
    {
        "slug": "strengthening_weakening_arguments",
        "name": "Strengthening & Weakening Logical Arguments",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability",
        "description": "Evaluating arguments by introducing new evidence that bolsters or undermines the author's stated conclusion; identifying flaws in logic, counter-evidence, and ungrounded leaps.",
        "entities": ["Strengthen Argument", "Weaken Argument", "Flaws in Reasoning", "Counter Evidence", "Premise Support"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2"], "banking": ["Critical-Reasoning"]}
    },
    {
        "slug": "paradox_resolution_evaluating_premises",
        "name": "Paradox Resolution & Premise Consistency",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability",
        "description": "Resolving apparent contradictions or counterintuitive statistical paradoxes in verbal statements; checking consistency and validity among interdependent premises.",
        "entities": ["Paradox Resolution", "Apparent Contradiction", "Premise Consistency", "Logical Reconciliation"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2"], "banking": ["Critical-Reasoning"]}
    },

    # -------------------------------------------------------------
    # Topic 3: interpersonal_communication_skills
    # -------------------------------------------------------------
    {
        "slug": "statement_arguments_assumptions_conclusions",
        "name": "Statement-Assumption, Argument & Course of Action",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills",
        "description": "Evaluating strong vs weak arguments, determining valid assumptions underlying policy statements, and selecting feasible, balanced, and non-drastic courses of action.",
        "entities": ["Statement and Arguments", "Statement and Assumptions", "Statement and Conclusions", "Course of Action", "Strong vs Weak Arguments"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Verbal-Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "cause_and_effect_reasoning",
        "name": "Cause and Effect Analysis",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills",
        "description": "Determining whether two related events represent an independent cause, principal effect, common cause, or coincidental correlation.",
        "entities": ["Cause and Effect", "Principal Cause", "Independent Cause", "Common Cause Effect"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2"], "ssc": ["Verbal-Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "administrative_decision_making_crisis_management",
        "name": "Administrative Decision Making & Situational Judgement",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills",
        "description": "Handling administrative ethical dilemmas, public service conflicts of interest, disaster emergency response prioritization, stakeholder negotiation, and ethical balance.",
        "entities": ["Administrative Decision Making", "Situational Judgement", "Crisis Management", "Public Service Ethics", "Conflict Resolution"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"]}
    },

    # -------------------------------------------------------------
    # Topic 4: number_systems_basic_arithmetic
    # -------------------------------------------------------------
    {
        "slug": "number_types_divisibility_rules",
        "name": "Number Classification & Divisibility Rules",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Classification of numbers (natural, integers, rational, irrational, prime, composite, co-prime); divisibility tests for 2 through 19, 72, 88, 99; properties of consecutive integers.",
        "entities": ["Natural Numbers", "Integers", "Prime Numbers", "Co-prime Numbers", "Divisibility Rules for 7, 11, 13, 72, 88", "Consecutive Integers"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "remainders_unit_digit_factorials_cyclicity",
        "name": "Remainders, Unit Digits & Factorial Arithmetic",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Remainder theorems (Euler's totient, Fermat's Little theorem, Wilson's theorem, polynomial remainders), cyclicity of powers and unit digit calculation, trailing zeros in factorials.",
        "entities": ["Remainder Theorems", "Euler Totient Function", "Fermat's Little Theorem", "Unit Digit Cyclicity", "Trailing Zeros in n!", "Highest Power of Prime dividing n!"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "lcm_hcf_factors_multiples",
        "name": "LCM, HCF, Factors & Multiples",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Highest Common Factor (HCF), Least Common Multiple (LCM), product rule, number of factors/divisors, sum of divisors, bells tolling / circular track meeting times.",
        "entities": ["LCM and HCF", "Prime Factorization", "Total Number of Factors", "Sum and Product of Factors", "Word Problems on HCF & LCM"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "fractions_decimals_surds_indices",
        "name": "Fractions, Decimals, Surds & Indices",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Operations on recurring decimals, continued fractions, surds simplification, laws of indices, ascending/descending comparison of exponents and irrational roots.",
        "entities": ["Recurring Decimals", "Continued Fractions", "Surds Simplification", "Laws of Indices", "Exponent Comparison"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "algebraic_identities_linear_quadratic_equations",
        "name": "Algebraic Identities & Linear / Quadratic Equations",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Standard polynomial identities, roots of quadratic equations, nature of roots (discriminant), simultaneous linear equations, word problems involving unknown variables.",
        "entities": ["Algebraic Identities", "Linear Equations in Two Variables", "Quadratic Equations", "Nature of Roots", "Algebraic Word Problems"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "progressions_sequences_ap_gp",
        "name": "Progressions & Number Sequences (AP & GP)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic",
        "description": "Arithmetic Progression (AP) nth term and sum of n terms, Geometric Progression (GP) nth term and finite/infinite series sums, harmonic progression basics.",
        "entities": ["Arithmetic Progression (AP)", "Geometric Progression (GP)", "nth Term Formula", "Sum of n Terms", "Infinite GP Series"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 5: percentages_averages_ratio-proportion
    # -------------------------------------------------------------
    {
        "slug": "percentages_successive_change",
        "name": "Percentages, Successive Change & Base Effects",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion",
        "description": "Percentage calculation, percentage increase/decrease, formula for successive percentage changes (a + b + ab/100), base shift concepts, population depreciation/growth over years.",
        "entities": ["Percentage Calculations", "Successive Percentage Change", "Base Shift Concept", "Population Growth & Depreciation", "Pass/Fail Exam Cutoffs"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "averages_weighted_averages_alligation",
        "name": "Averages, Weighted Averages & Alligations",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion",
        "description": "Arithmetic mean, weighted averages, effect of inclusion/exclusion/replacement on group averages, alligation rule and multi-mixture blending.",
        "entities": ["Arithmetic Average", "Weighted Average", "Change in Average on Replacement", "Mixtures and Alligations", "Alligation Cross Method"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "ratio_proportion_variations_partnerships",
        "name": "Ratio, Proportion, Variation & Partnerships",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion",
        "description": "Compound ratios, mean/third/fourth proportional, direct and inverse variation, capital-time profit sharing in business partnerships, coin denomination word problems.",
        "entities": ["Direct & Inverse Proportion", "Mean Proportional", "Business Partnerships", "Profit Sharing Ratio", "Coin Counting Puzzles"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "problems_on_ages",
        "name": "Problems on Ages",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion",
        "description": "Formulation of simultaneous linear equations based on chronological age relations (past, present, future age ratios and differentials).",
        "entities": ["Age Word Problems", "Past Present Future Age Ratios", "Age Difference Invariance"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 6: profit_loss_interest_discount (Split Simple & Compound Interest)
    # -------------------------------------------------------------
    {
        "slug": "profit_loss_marked_price_discounts",
        "name": "Profit, Loss, Marked Price & Dishonest Dealers",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount",
        "description": "Cost price, selling price, profit/loss percentage, marked price, trade discounts, successive discounts equivalent single discount, faulty weights and dishonest seller calculations.",
        "entities": ["Cost Price and Selling Price", "Profit and Loss Percentage", "Marked Price and Discount", "Successive Discounts", "Dishonest Dealer & Faulty Weights"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "simple_interest_installments",
        "name": "Simple Interest & Installments",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount",
        "description": "Principles of Simple Interest (SI = P*R*T/100), interest calculations with variable rates and fractional years, finding sum and principal, simple interest installments and loan amortization.",
        "entities": ["Simple Interest (SI)", "Principal and Amount", "Variable Rates of Simple Interest", "Simple Interest Installments", "SI Word Problems"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "compound_interest_installments",
        "name": "Compound Interest & Periodical Compounding",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount",
        "description": "Compound Interest (CI) with annual, semi-annual, and quarterly compounding; difference between CI and SI for 2 & 3 years; compounding growth in population/depreciation; equal annual installments (EMI).",
        "entities": ["Compound Interest (CI)", "Compounding Frequency (Half-yearly, Quarterly)", "Difference between CI and SI Formula", "Population Compounding & Depreciation", "Equal Annual Installments (EMI)"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 7: time_work_speed_distance
    # -------------------------------------------------------------
    {
        "slug": "time_and_work_pipes_and_cisterns",
        "name": "Time & Work, Pipes & Cisterns, Wages",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance",
        "description": "Unitary work method, individual vs combined efficiency, alternate day work cycles, inlet/outlet pipes with negative work rates, division of wages based on work contribution.",
        "entities": ["Time and Work Efficiency", "Man-Hours Work Formula", "Alternate Working Days", "Pipes and Cisterns", "Work and Wages Division"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "speed_time_distance_trains",
        "name": "Speed, Time & Distance, Problems on Trains",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance",
        "description": "Speed conversions (km/h to m/s), average speed for harmonic journeys, relative speed of objects moving in same vs opposite directions, train crossing a pole/platform/another train.",
        "entities": ["Speed-Time-Distance Formula", "Average Speed for Round Trips", "Relative Speed", "Train Crossing Moving Objects", "Train Crossing Bridges and Platforms"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "boats_streams_races_circular_tracks",
        "name": "Boats, Streams, Races & Circular Motion",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance",
        "description": "Speed in still water vs stream velocity, upstream and downstream speed, linear races with distance/time head starts, circular track meeting times and lead laps.",
        "entities": ["Upstream and Downstream Speed", "Boats and Streams Formula", "Linear Races Head Starts", "Dead Heats", "Circular Track Motion"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 8: permutation_combination_probability
    # -------------------------------------------------------------
    {
        "slug": "fundamental_counting_principle_permutations",
        "name": "Fundamental Counting Principle & Permutations",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability",
        "description": "Multiplication and addition principles of counting, factorials, permutations of n distinct objects, arrangements with repetition, arrangements with restrictions, circular permutations.",
        "entities": ["Fundamental Principle of Counting", "Factorial Properties", "Permutations nPr", "Arrangements with Restricted Positions", "Circular Permutations (n-1)!"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "combinations_selections_geometry_combinations",
        "name": "Combinations, Selections & Geometric Combinatorics",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability",
        "description": "Selection formula nCr, committee/team formation with conditions, distribution of identical items into distinct groups, number of diagonals in polygons, triangles formed by points.",
        "entities": ["Combinations nCr", "Committee Formation Constraints", "Geometric Selections (Lines, Triangles, Diagonals)", "Handshake Problems", "Partitioning into Groups"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "probability_events_conditional_bayes",
        "name": "Probability, Independent Events & Conditional Odds",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability",
        "description": "Classical definition of probability, sample spaces (coins, dice, deck of 52 cards, balls from urns), addition theorem P(A u B), mutually exclusive vs independent events, conditional probability P(A|B).",
        "entities": ["Classical Probability", "Sample Space & Favourable Outcomes", "Dice and Coin Probability", "Playing Cards & Urns", "Independent Events", "Conditional Probability"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "set_theory_venn_diagrams_max_min",
        "name": "Set Theory, Venn Diagrams & Maxima-Minima",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability",
        "description": "Two-set and three-set Venn diagrams, union and intersection formulas, survey data deductions, determining maximum and minimum overlap among groups.",
        "entities": ["Two-set Venn Diagram", "Three-set Venn Diagram", "Set Union & Intersection", "Maxima and Minima in Overlapping Sets", "Survey Data Analysis"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 9: mensuration_geometry
    # -------------------------------------------------------------
    {
        "slug": "2d_geometry_mensuration_triangles_circles_polygons",
        "name": "2D Geometry & Mensuration (Lines, Triangles, Quadrilaterals, Circles)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry",
        "description": "Angle properties, Pythagoras theorem, triangle congruence & similarity, area of triangles (Heron's formula), rectangles, rhombuses, trapezoids, circles (arcs, sectors, segments), inscribed/circumscribed shapes.",
        "entities": ["Pythagorean Triples", "Triangle Area (Heron's Formula)", "Circles, Sectors and Arcs", "Quadrilaterals & Parallelograms", "Regular Polygons", "Inscribed & Circumscribed Circles"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },
    {
        "slug": "3d_mensuration_solids_surface_area_volume",
        "name": "3D Mensuration (Cubes, Cuboids, Cylinders, Cones, Spheres)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry",
        "description": "Total surface area, lateral surface area, volume of standard 3D solids (cube, cuboid, cylinder, cone, sphere, hemisphere, frustum), melting and recasting solids into new shapes.",
        "entities": ["Cube and Cuboid Volume & Surface Area", "Cylinder and Cone Mensuration", "Sphere and Hemisphere Properties", "Melting & Recasting Metal Shapes", "Water Level Rise in Containers"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant"], "banking": ["Quant"]}
    },

    # -------------------------------------------------------------
    # Topic 10: logical_analytical_reasoning
    # -------------------------------------------------------------
    {
        "slug": "syllogisms_venn_logical_deductions",
        "name": "Syllogisms & Categorical Propositions",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "Deductive categorical syllogisms (All A are B, Some A are B, No A is B, Some A are not B), Euler/Venn diagram representation, 'Only a few', possibility conclusions, reverse syllogisms.",
        "entities": ["Categorical Propositions", "Standard Syllogism Deductions", "Possibility Cases in Syllogisms", "Venn Diagram Method for Syllogisms", "Only a Few / Some Not Rules"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "linear_circular_complex_seating_arrangements",
        "name": "Linear, Circular & Complex Seating Arrangements",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "Linear row seating (unidirectional and bidirectional facing), circular table arrangements (inward, outward, mixed facing), rectangular/polygonal seating with multi-variable attributes.",
        "entities": ["Linear Row Arrangements", "Circular Seating Arrangements (Inward/Outward)", "Multi-variable Seating Puzzles", "Double Row Parallel Arrangements"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "blood_relations_family_trees_coded_relations",
        "name": "Blood Relations & Coded Family Trees",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "Deciphering kinship relations from direct descriptive statements, generation tree diagramming, coded blood relations, paternal vs maternal lineages.",
        "entities": ["Family Tree Generation Diagrams", "Direct Statement Kinship", "Coded Blood Relations", "Paternal vs Maternal Relations"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "direction_distance_sense_shadows",
        "name": "Direction Sense, Cardinal Movements & Shadows",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "8-point compass directions (North, South, East, West, NE, NW, SE, SW), distance tracking via Pythagoras theorem, angular clockwise/counter-clockwise turns, sunrise and sunset shadow directions.",
        "entities": ["Cardinal & Intercardinal Directions", "Pythagoras Distance Calculation", "Angular Turns (Clockwise/Anti-clockwise)", "Sunrise and Sunset Shadow Logic"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "clocks_angle_coincidence_faulty_clocks",
        "name": "Clocks: Angles, Coincidence & Faulty Clocks",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "Angle between hour hand and minute hand at any given time, times when hands coincide (0 deg), form a right angle (90 deg), or are in opposite directions (180 deg), fast and slow gaining/losing clocks.",
        "entities": ["Angle Between Clock Hands Formula", "Coincidence of Clock Hands", "Opposite Hands (180 Degrees)", "Right Angles in Clocks", "Gaining and Losing Time (Faulty Clocks)"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "calendar_odd_days_leap_years_repetition",
        "name": "Calendars: Odd Days, Leap Years & Repetition",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning",
        "description": "Counting odd days in normal and leap years, century odd days (100, 200, 300, 400 years), finding the exact day of the week for historical dates, repetition of annual calendar cycles.",
        "entities": ["Odd Days Calculation", "Leap Year & Solar Year Rules", "Century Leap Days", "Day Determination for Past/Future Dates", "Calendar Repetition Cycle"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },

    # -------------------------------------------------------------
    # Topic 11: data_interpretation_data_sufficiency (9 Granular Subtopics)
    # -------------------------------------------------------------
    {
        "slug": "tabular_di_and_missing_data_tables",
        "name": "Tabular DI & Missing Data Tables",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Single & multi-variable numerical data tables, missing value deductions based on conditional row/column totals, percentages, ratios, and averages.",
        "entities": ["Tabular Data Interpretation", "Missing Data Tables", "Row-Column Aggregates", "Multi-Variable Matrix", "Table Percentage Growth"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "bar_charts_simple_grouped_stacked",
        "name": "Bar Charts (Simple, Grouped & Stacked)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Horizontal and vertical bar charts, clustered/grouped bar charts, subdivided/stacked component bar charts, and cumulative percentage bar graphs.",
        "entities": ["Single Bar Chart", "Grouped / Clustered Bars", "Stacked / Subdivided Bar Charts", "Percentage Component Bar Chart", "Comparative YoY Growth"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "line_graphs_multiseries_trends",
        "name": "Line Graphs & Multi-Series Trend Curves",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Single and multi-line graphs, continuous time-series trend analysis, YoY & CAGR growth curves, intersecting lines and break-even comparison points.",
        "entities": ["Line Graph", "Multi-Line Comparison", "Continuous Time Series", "YoY Trend Curves", "Intersecting Data Lines"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "pie_charts_percentage_degree_distribution",
        "name": "Pie Charts (Percentage & Degree Distribution)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Single circular distribution charts, percentage-based vs degree-based (360 deg) sector angle conversions, dual/comparative pie charts across years or categories.",
        "entities": ["Single Pie Chart", "Degree to Percentage Conversion (3.6 deg = 1%)", "Dual Comparative Pie Charts", "Sector Value Calculations", "Multi-Tier Circular Distribution"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "mixed_graphs_multiaxis_combinations",
        "name": "Mixed Graphs & Multi-Axis Combinations",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Hybrid multi-format visualizations (Bar + Line combo charts, Table + Pie chart combinations), dual vertical axis (Y1 and Y2) with different units and scales.",
        "entities": ["Mixed Charts (Bar + Line)", "Dual Y-Axis Plots", "Table and Pie Combinations", "Volume vs Percentage Mix", "Hybrid Multi-Layer Graphs"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "caselet_di_paragraph_data",
        "name": "Caselet DI & Textual Paragraph Data",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Unstructured paragraph caselets, converting complex textual descriptions into structured tables or mathematical models, variable-driven algebraic caselets.",
        "entities": ["Caselet DI (Paragraph Data)", "Tabular Structuring of Text", "Variable-Driven Caselets", "Arithmetic Word Caselets"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "venn_diagram_based_di_and_set_caselets",
        "name": "Venn Diagram-Based DI & Set Caselets",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Visual and numerical representation of datasets using 2-set, 3-set, and 4-set Venn diagrams; calculating exclusive category values ('Only A', 'Only B and C'), total intersections, survey data analysis, and maxima/minima in set overlaps.",
        "entities": ["Venn Diagram Data Interpretation", "2-Set Venn Calculations", "3-Set Venn Overlaps", "Exclusive Regions ('Only A')", "Survey Dataset Deductions", "Overlap Maxima and Minima"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "radar_spider_scatter_plots",
        "name": "Radar, Spider & Scatter Plots",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Multi-dimensional radial spider/web charts, triangular coordinate plots, scatter plots showing distribution and correlation between two quantitative variables.",
        "entities": ["Radar / Spider Chart", "Radial Axis Grid", "Triangular Coordinate Charts", "Scatter Plots", "Multi-Dimensional Performance Mapping"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["DI"], "banking": ["DI"]}
    },
    {
        "slug": "data_sufficiency_evaluating_statements",
        "name": "Data Sufficiency (Arithmetic, Algebraic & Logical Statements)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        "description": "Determining whether Statement 1 alone, Statement 2 alone, both statements together, or neither statement is sufficient to answer questions in algebra, geometry, order/ranking, or kinship.",
        "entities": ["Two-Statement Data Sufficiency", "Three-Statement Data Sufficiency", "Sufficiency Decision Matrix (A/B/C/D/E)", "Arithmetic & Algebraic DS", "Reasoning & Direction DS"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },

    # -------------------------------------------------------------
    # Topic 12: problem_solving_pattern_recognition
    # -------------------------------------------------------------
    {
        "slug": "number_letter_alphanumeric_series",
        "name": "Number, Letter & Alphanumeric Symbol Series",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "Arithmetic, geometric, alternating, square/cube, difference-of-differences numerical series; alphabetical step series, alphanumeric sequence with symbols and conditional filters.",
        "entities": ["Difference of Differences Series", "Alternating Number Series", "Square and Cube Series", "Alphabet Progression Series", "Alpha-Numeric Symbol Sequences"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "coding_decoding_matrix_substitution",
        "name": "Coding-Decoding & Substitution Logic",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "Letter-to-letter shifting (forward/reverse alphabetical positions), letter-to-number substitution, symbol coding, fictitious language / Chinese coding, matrix coordinate coding.",
        "entities": ["Letter Positional Shifting", "Reverse Alphabet Coding", "Fictitious Language Coding (Word Substitution)", "Matrix Coding & Decryption"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "order_ranking_comparative_arrangements",
        "name": "Order, Ranking & Comparative Inequalities",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "Calculating total people in a queue from left/right ranks, interchanging positions, overlapping ranking, chain inequalities (A > B >= C = D) and deduced relations.",
        "entities": ["Single-Row Position Ranking", "Interchanging Positions in Queue", "Overlapping vs Non-overlapping Ranks", "Coded Inequalities"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "cubes_dice_folding_nets_painting",
        "name": "Cubes & Dice (Opposite Faces, Nets & Painted Slices)",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "Standard vs ordinary dice, identifying opposite faces from 2 or more dice positions, unfolded dice nets folding rules, painted cube slicing (faces painted on 3, 2, 1, 0 sides).",
        "entities": ["Standard vs Non-Standard Dice", "Adjacent and Opposite Faces of Dice", "Unfolded Dice Nets", "Painted Cube Slicing Formulas n^3"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "non_verbal_reasoning_mirror_water_figure_completion",
        "name": "Non-Verbal Reasoning & Visual Patterns",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "Horizontal and vertical mirror images, water reflections, paper folding and punch hole patterns, embedded figures, figure matrix completion, geometric figure series.",
        "entities": ["Mirror Images & Inversions", "Water Reflection Logic", "Paper Folding & Hole Punching", "Embedded Hidden Figures", "Figure Matrix & Series Completion"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    },
    {
        "slug": "mathematical_operators_symbolic_logic",
        "name": "Mathematical Operators & Cryptarithmetic Puzzles",
        "parentId": "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        "description": "BODMAS evaluation after interchanging signs and numbers, balancing equations, alphabetic cryptarithmetic arithmetic puzzles (letter substitution for digits 0-9).",
        "entities": ["BODMAS Sign Interchange", "Balancing Equations", "Symbolic Math Operators", "Cryptarithmetic Letter Puzzles"],
        "examTags": {"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Reasoning"], "banking": ["Reasoning"]}
    }
]

def generate_keywords(name, description, entities):
    text = f"{name} {description} {' '.join(entities)}"
    words = re.findall(r'[a-zA-Z0-9\~%]+', text)
    seen = set()
    keywords = []
    stopwords = {"and", "or", "the", "a", "an", "in", "on", "of", "to", "for", "with", "by", "from", "at", "is", "are", "vs", "etc"}
    for w in words:
        wl = w.lower()
        if wl not in stopwords and len(w) > 1 and w not in seen:
            seen.add(w)
            keywords.append(w)
    return keywords

def main():
    kg_path = "src/data/knowledge_graph.json"
    with open(kg_path, "r", encoding="utf-8") as f:
        kg = json.load(f)

    nodes = kg["nodes"]
    subject_id = "general_mental_ability_quantitative_aptitude_comprehension"
    subject_name = "General Mental Ability, Quantitative Aptitude & Comprehension"

    # 1. Clean up existing level-4 nodes under GMA to prevent stale/obsolete nodes
    gma_l4_to_remove = [k for k, v in nodes.items() if k.startswith(subject_id) and v.get("level") == 4]
    print(f"Removing {len(gma_l4_to_remove)} existing Level-4 GMA nodes before rebuild...")
    for k in gma_l4_to_remove:
        del nodes[k]

    # 2. Reset childrenIds on all GMA Level-3 topic nodes
    for k, v in nodes.items():
        if k.startswith(subject_id) and v.get("level") == 3:
            v["childrenIds"] = []

    # 3. Add updated subtopics
    added_count = 0
    for sub in SUBTOPICS:
        parent_id = sub["parentId"]
        node_id = f"{parent_id}.{sub['slug']}"
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"Error: Parent node {parent_id} not found!")
            continue

        ancestor_ids = list(parent_node.get("ancestorIds", [])) + [parent_id]
        keywords = generate_keywords(sub["name"], sub["description"], sub["entities"])

        raw_tag_parts = []
        for k, v in sub["examTags"].items():
            raw_tag_parts.append(f"[{k.upper()}: {', '.join(v)}]")
        raw_exam_tag_string = " ".join(raw_tag_parts)

        node_obj = {
            "id": node_id,
            "slug": sub["slug"],
            "name": sub["name"],
            "level": 4,
            "levelName": "Subtopic_Entity",
            "subject": subject_name,
            "subjectId": subject_id,
            "parentId": parent_id,
            "childrenIds": [],
            "ancestorIds": ancestor_ids,
            "examTags": sub["examTags"],
            "rawExamTagString": raw_exam_tag_string,
            "description": sub["description"],
            "entities": sub["entities"],
            "keywords": keywords
        }

        nodes[node_id] = node_obj

        # Update parent childrenIds
        if node_id not in parent_node.get("childrenIds", []):
            parent_node.setdefault("childrenIds", []).append(node_id)

        added_count += 1

    # 4. Update stats
    l1_count = sum(1 for n in nodes.values() if n.get("level") == 1)
    l2_count = sum(1 for n in nodes.values() if n.get("level") == 2)
    l3_count = sum(1 for n in nodes.values() if n.get("level") == 3)
    l4_count = sum(1 for n in nodes.values() if n.get("level") == 4)

    kg["stats"] = {
        "total_nodes": len(nodes),
        "level_1_subjects": l1_count,
        "level_2_domains": l2_count,
        "level_3_topics": l3_count,
        "level_4_subtopics": l4_count
    }

    with open(kg_path, "w", encoding="utf-8") as f:
        json.dump(kg, f, indent=2, ensure_ascii=False)

    print(f"Successfully rebuilt {added_count} granular Level-4 Subtopics in knowledge_graph.json.")
    print(f"New KG Total Nodes: {len(nodes)} (L1: {l1_count}, L2: {l2_count}, L3: {l3_count}, L4: {l4_count})")

if __name__ == "__main__":
    main()

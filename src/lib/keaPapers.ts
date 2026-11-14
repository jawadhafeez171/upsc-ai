/**
 * Every KEA paper in `kea_questions`, grouped by the post it recruits for.
 * Built from the table on 13 Nov 2026 (64 papers, 6,364 questions): when papers are added there, add them here.
 * `code` is the exact `paper_code`; labels are written for people, since many codes are raw file names.
 */
export type KeaFamily = 'fda-sda' | 'group-posts' | 'leg-council' | 'police' | 'vao' | 'engineering' | 'coaching' | 'kset';

export type KeaPaper = { code: string; family: KeaFamily; label: string; date: string; year: number; qs: number };

export const KEA_FAMILIES: { key: KeaFamily; label: string; kn: string; hint: string }[] = [
    { key: 'fda-sda', label: 'FDA & SDA', kn: 'ಪ್ರಥಮ ಮತ್ತು ದ್ವಿತೀಯ ದರ್ಜೆ ಸಹಾಯಕ', hint: 'First and Second Division Assistant' },
    { key: 'group-posts', label: 'Other departments & corporations', kn: 'ಇತರ ಇಲಾಖೆಗಳು ಮತ್ತು ನಿಗಮಗಳು', hint: 'Group A, B and C posts in departments, boards and corporations' },
    { key: 'police', label: 'Police', kn: 'ಪೊಲೀಸ್', hint: 'Civil PC, KSRP/KSISF/IRB PC and PSI' },
    { key: 'vao', label: 'VAO & Compulsory Kannada', kn: 'ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ ಮತ್ತು ಕಡ್ಡಾಯ ಕನ್ನಡ', hint: 'Village Administrative Officer' },
    { key: 'leg-council', label: 'Legislative Council', kn: 'ವಿಧಾನ ಪರಿಷತ್ತು', hint: 'Council Secretariat posts' },
    { key: 'engineering', label: 'Engineering', kn: 'ಎಂಜಿನಿಯರಿಂಗ್', hint: 'AE and JE posts' },
    { key: 'coaching', label: 'Free coaching entrance', kn: 'ಉಚಿತ ತರಬೇತಿ ಪ್ರವೇಶ ಪರೀಕ್ಷೆ', hint: 'SWD, BCWD, minority and KEA coaching' },
    { key: 'kset', label: 'KSET', kn: 'ಕೆ-ಸೆಟ್', hint: 'State Eligibility Test, Paper 1' },
];

/** Post name in the reader's language. */
export const keaFamilyName = (key: string, lang: string) => {
    if (key === 'all') return lang === 'kn' ? 'ಎಲ್ಲಾ ಹುದ್ದೆಗಳು' : 'All posts';
    const f = KEA_FAMILIES.find((x) => x.key === key);
    return f ? (lang === 'kn' ? f.kn : f.label) : key;
};

export const KEA_PAPERS: KeaPaper[] = [
    // FDA & SDA
    { code: 'R02-S1_FDA-SDA-HK-21Dec25__KEC1_HK_21-12-2025_GK', family: 'fda-sda', label: 'FDA (Kalyana Karnataka) · Paper 1 General Knowledge', date: '21 Dec 2025', year: 2025, qs: 100 },
    { code: 'R02-S1_FDA-SDA-HK-21Dec25__KEC1_HK_21-12-2025_P2', family: 'fda-sda', label: 'FDA (Kalyana Karnataka) · Paper 2 Kannada, English & Computer', date: '21 Dec 2025', year: 2025, qs: 100 },
    { code: 'R02-S2_FDA-SDA-RPC-11Jan26__FDA_NHK_11-01-2026_GK', family: 'fda-sda', label: 'FDA (Non-HK) · Paper 1 General Knowledge', date: '11 Jan 2026', year: 2026, qs: 100 },
    { code: 'R02-S2_FDA-SDA-RPC-11Jan26__FDA_NHK_11-01-2026_P2', family: 'fda-sda', label: 'FDA (Non-HK) · Paper 2 Kannada, English & Computer', date: '11 Jan 2026', year: 2026, qs: 100 },
    { code: 'R02-S3_FDA-SDA-RPC-25Jan26__SDA_NHK_25-01-2026_GK', family: 'fda-sda', label: 'SDA (Non-HK) · Paper 1 General Knowledge', date: '25 Jan 2026', year: 2026, qs: 100 },
    { code: 'R02-S3_FDA-SDA-RPC-25Jan26__SDA_NHK_25-01-2026_P2', family: 'fda-sda', label: 'SDA (Non-HK) · Paper 2 Kannada, English & Computer', date: '25 Jan 2026', year: 2026, qs: 100 },
    { code: 'R02-S4_FDA-SDA-HK-22Feb26__SDA_HK_22-02-2026_GK', family: 'fda-sda', label: 'SDA (Kalyana Karnataka) · Paper 1 General Knowledge', date: '22 Feb 2026', year: 2026, qs: 100 },
    { code: 'R02-S4_FDA-SDA-HK-22Feb26__SDA_HK_22-02-2026_P2', family: 'fda-sda', label: 'SDA (Kalyana Karnataka) · Paper 2 Kannada, English & Computer', date: '22 Feb 2026', year: 2026, qs: 100 },
    { code: 'R27-S1_KEA-FDA-28Oct23__KEA_FDA_GK_2023', family: 'fda-sda', label: 'FDA · Paper 1 General Knowledge', date: '28 Oct 2023', year: 2023, qs: 100 },
    { code: 'R27-S1_KEA-FDA-28Oct23__KEA_FDA_Communication_2023', family: 'fda-sda', label: 'FDA · Paper 2 Communication', date: '28 Oct 2023', year: 2023, qs: 100 },
    { code: 'R27-S2_KEA-SDA-29Oct23__KEA_SDA_GK_2023', family: 'fda-sda', label: 'SDA · Paper 1 General Knowledge', date: '29 Oct 2023', year: 2023, qs: 100 },
    { code: 'R27-S2_KEA-SDA-29Oct23__KEA_SDA_Communication_2023', family: 'fda-sda', label: 'SDA · Paper 2 Communication', date: '29 Oct 2023', year: 2023, qs: 100 },
    { code: 'R23-S3_KRIDL-FDA-Feb23__KRIDL_FDA_GK', family: 'fda-sda', label: 'KRIDL FDA · General Knowledge', date: 'Feb 2023', year: 2023, qs: 100 },
    { code: 'R23-S4_KRIDL-SDA-Feb23__KRIDL_SDA_GK', family: 'fda-sda', label: 'KRIDL SDA · General Knowledge', date: 'Feb 2023', year: 2023, qs: 100 },

    // Group A, B & C posts in departments, boards and corporations
    { code: 'R03-S1_GroupAB-26Apr26__GroupAB_NHK_26-04-2026_P2', family: 'group-posts', label: 'Group A & B (Non-HK) · Paper 2 Kannada, English & Computer', date: '26 Apr 2026', year: 2026, qs: 100 },
    { code: 'R03-S2_GroupAB-AE-10May26__KEA_Unidentified_GP_B1_OAM10526_c.10-05-2026', family: 'group-posts', label: 'Group A & B · General Paper (post not stated)', date: '10 May 2026', year: 2026, qs: 100 },
    { code: 'R03-S3_GroupAB-KK-04Jul26__GroupAB_KK_04-07-2026_GK', family: 'group-posts', label: 'Group A & B (Kalyana Karnataka) · General Knowledge', date: '4 Jul 2026', year: 2026, qs: 100 },
    { code: 'R03-S4_GroupAB-RPC-05Jul26__GroupAB_RPC_05-07-2026_GK', family: 'group-posts', label: 'Group A & B (Non-HK) · General Knowledge', date: '5 Jul 2026', year: 2026, qs: 100 },
    { code: 'R07-S1_NWKRTC-10Apr26__NWKRTC_GroupB_10-04-2026_GK', family: 'group-posts', label: 'NWKRTC Group B · Paper 1 General Knowledge', date: '10 Apr 2026', year: 2026, qs: 100 },
    { code: 'R08-S1_RFO-12Jul26__RFO_12-07-2026_P1_GK_Aptitude', family: 'group-posts', label: 'Range Forest Officer · Paper 1 General Knowledge & Aptitude', date: '12 Jul 2026', year: 2026, qs: 125 },
    { code: 'R09-S1_Unidentified-May26__KEA_Unidentified_GK_P1_A1_c.May-2026', family: 'group-posts', label: 'General Knowledge paper (post not stated)', date: 'May 2026', year: 2026, qs: 100 },
    { code: 'R17-S1_KUWSDB-KKRTC-13Jul24__kuwsdb_kkrtc_2024_gk1', family: 'group-posts', label: 'KUWSDB & KKRTC · General Knowledge', date: '13 Jul 2024', year: 2024, qs: 100 },
    { code: 'R17-S1_KUWSDB-KKRTC-13Jul24__kuwsdb_kkrtc_2024_kec1', family: 'group-posts', label: 'KUWSDB & KKRTC · Kannada, English & Computer', date: '13 Jul 2024', year: 2024, qs: 100 },
    { code: 'R17-S2_BMTC-KKRTC-14Jul24__bmtc_kkrtc_2024_gk2_c4', family: 'group-posts', label: 'BMTC & KKRTC · General Knowledge', date: '14 Jul 2024', year: 2024, qs: 100 },
    { code: 'R17-S2_BMTC-KKRTC-14Jul24__bmtc_kkrtc_2024_kec2_d1', family: 'group-posts', label: 'BMTC & KKRTC · Kannada, English & Computer', date: '14 Jul 2024', year: 2024, qs: 100 },
    { code: 'R18-S1_BMTC-Conductor-RPC-01Sep24__bmtc_conductor_2024_gk_a3', family: 'group-posts', label: 'BMTC Conductor · General Knowledge', date: '1 Sep 2024', year: 2024, qs: 97 },
    { code: 'R18-S1_BMTC-Conductor-RPC-01Sep24__bmtc_conductor_2024_paper2_a3', family: 'group-posts', label: 'BMTC Conductor · Paper 2', date: '1 Sep 2024', year: 2024, qs: 100 },
    { code: 'R22-S1_GTTC-AsstGr2-09Dec24__gttc_2024_gk1_b1', family: 'group-posts', label: 'GTTC Assistant Gr-II · Paper 1 General Knowledge', date: '9 Dec 2024', year: 2024, qs: 100 },
    { code: 'R22-S2_GTTC-OffGr2-AsstGr2-14Dec24__gttc_officer_gr2_2024_gk_d1', family: 'group-posts', label: 'GTTC Officer Gr-II · Paper 1 General Knowledge', date: 'Dec 2024', year: 2024, qs: 100 },
    { code: 'R22-S2_GTTC-OffGr2-AsstGr2-14Dec24__gttc_2024_communication2_a1', family: 'group-posts', label: 'GTTC Officer / Assistant Gr-II · Paper 2 Kannada, English & Computer', date: '14 Dec 2024', year: 2024, qs: 100 },
    { code: 'R24-S2_KSSCL-SJA-P1-02Feb23__KSSCL_JA_P1_GK', family: 'group-posts', label: 'KSSCL Junior Assistant · Paper 1 General Knowledge', date: '2 Feb 2023', year: 2023, qs: 100 },
    { code: 'R24-S1_KSSCL-SJA-P2-01Feb23__KSSCL_JA_P2_KanEng', family: 'group-posts', label: 'KSSCL Junior Assistant · Paper 2 Kannada & English', date: '1 Feb 2023', year: 2023, qs: 100 },
    { code: 'R24-S3_KSSCL-AM-05Feb23__KSSCL_AM_P1', family: 'group-posts', label: 'KSSCL Assistant Manager · Paper 1', date: '5 Feb 2023', year: 2023, qs: 100 },
    { code: 'R26-S1_GFGC-Principal-Jul23__GFGC_PRINCIPAL_P1', family: 'group-posts', label: 'Government First Grade College Principal · Paper 1', date: 'Jul 2023', year: 2023, qs: 100 },
    { code: 'R27-S3_KEA-WO-FI-19Nov23__KEA_GK_19Nov2023', family: 'group-posts', label: 'Welfare Officer & Factory Inspector · General Knowledge', date: '19 Nov 2023', year: 2023, qs: 100 },
    { code: 'R27-S3_KEA-WO-FI-19Nov23__KEA_LabourLaw_19Nov2023', family: 'group-posts', label: 'Welfare Officer & Factory Inspector · Labour Law', date: '19 Nov 2023', year: 2023, qs: 100 },

    // Legislative Council Secretariat
    { code: 'R01-S1_LegCouncil-22Mar25__LegCouncil_JrConsoleOperator_22-03-2025_P2', family: 'leg-council', label: 'Junior Console Operator · Paper 2 Specific', date: '22 Mar 2025', year: 2025, qs: 100 },
    { code: 'R01-S2_LegCouncil-23Mar25__LegCouncil_Asst_JrAsst_CompOp_JrConsoleOp_23-03-2025_GK', family: 'leg-council', label: 'Assistant, Jr Assistant & Operators · General Knowledge', date: '23 Mar 2025', year: 2025, qs: 100 },
    { code: 'R01-S2_LegCouncil-23Mar25__LegCouncil_Asst_JrAsst_23-03-2025_P2', family: 'leg-council', label: 'Assistant & Jr Assistant · Paper 2 Kannada, English & Computer', date: '23 Mar 2025', year: 2025, qs: 100 },
    { code: 'R01-S3_LegCouncil-24Mar25__LegCouncil_SrJrProgrammer_24-03-2025_P1_GS', family: 'leg-council', label: 'Senior & Junior Programmer · Paper 1 General Studies', date: '24 Mar 2025', year: 2025, qs: 100 },
    { code: 'R01-S3_LegCouncil-24Mar25__LegCouncil_SrJrProgrammer_24-03-2025_P2', family: 'leg-council', label: 'Senior & Junior Programmer · Paper 2 Specific', date: '24 Mar 2025', year: 2025, qs: 100 },
    { code: 'R01-S4_LegCouncil-25Mar25__LegCouncil_DataEntryAsst_25-03-2025_P1_GK', family: 'leg-council', label: 'Data Entry Assistant · Paper 1 General Knowledge', date: '25 Mar 2025', year: 2025, qs: 100 },

    // Police
    { code: 'R04-S1_CivilPC-RPC-02Aug26__CivilPC_RPC_02-08-2026_GK', family: 'police', label: 'Civil Police Constable (Non-HK) · General Knowledge', date: '2 Aug 2026', year: 2026, qs: 100 },
    { code: 'R04-S2_CivilPC-KK-02Aug26__CivilPC_KK_02-08-2026_GK', family: 'police', label: 'Civil Police Constable (Kalyana Karnataka) · General Knowledge', date: '2 Aug 2026', year: 2026, qs: 100 },
    { code: 'R05-S1_KSRP-PC-RPC-20Sep26__KSRP_PC_20-09-2026_GK', family: 'police', label: 'KSRP Police Constable (Non-HK) · General Knowledge', date: '20 Sep 2026', year: 2026, qs: 100 },
    { code: 'R05-S2_KSRP-PC-KK-20Sep26__KSRP_KSISF_IRB_PC_HK_20-09-2026_GK', family: 'police', label: 'KSRP/KSISF/IRB Police Constable (Kalyana Karnataka) · General Knowledge', date: '20 Sep 2026', year: 2026, qs: 100 },
    { code: 'R20-S1_PSI-402-03Oct24__psi_2024_paper2_a1', family: 'police', label: 'Police Sub-Inspector (402 posts) · Paper 2', date: '3 Oct 2024', year: 2024, qs: 100 },

    // VAO & Compulsory Kannada
    { code: 'R19-S3_VAO-27Oct24__vao_2024_paper1', family: 'vao', label: 'VAO · Paper 1', date: '27 Oct 2024', year: 2024, qs: 100 },
    { code: 'R19-S3_VAO-27Oct24__vao_2024_paper2', family: 'vao', label: 'VAO · Paper 2', date: '27 Oct 2024', year: 2024, qs: 100 },
    { code: 'R19-S1_VAO-GTTC-CompKannada-29Sep24__vao_gttc_compulsory_kannada_2024_29sep_c1', family: 'vao', label: 'VAO & GTTC · Compulsory Kannada', date: '29 Sep 2024', year: 2024, qs: 100 },
    { code: 'R19-S2_VAO-GTTC-CompKannada-26Oct24__vao_gttc_compulsory_kannada_2024_26oct_c1', family: 'vao', label: 'VAO & GTTC · Compulsory Kannada (2nd sitting)', date: '26 Oct 2024', year: 2024, qs: 100 },
    { code: 'R17-S3_CompKannada-KU-20Jul24__compulsory_kannada_2024_20jul_b', family: 'vao', label: 'Compulsory Kannada', date: '20 Jul 2024', year: 2024, qs: 100 },

    // Engineering
    { code: 'R06-S1_BWSSB-AE-04Jul26__CivilAE_BWSSB_04-07-2026_GS', family: 'engineering', label: 'BWSSB Assistant Engineer (Civil) · General Studies', date: '4 Jul 2026', year: 2026, qs: 100 },
    { code: 'R17-S4_AE-Civil-11Aug24__kea_ae_kuwsdb_2024_gk_d1', family: 'engineering', label: 'KUWSDB Assistant Engineer (Civil) · General Knowledge', date: '11 Aug 2024', year: 2024, qs: 100 },
    { code: 'R23-S2_KRIDL-AE-05Feb23__KRIDL_AE_P1', family: 'engineering', label: 'KRIDL Assistant Engineer · Paper 1', date: '5 Feb 2023', year: 2023, qs: 100 },
    { code: 'R23-S1_KRIDL-JE-29Jan23__KRIDL_JE_P1', family: 'engineering', label: 'KRIDL Junior Engineer · Paper 1', date: '29 Jan 2023', year: 2023, qs: 100 },

    // Free coaching entrance tests
    { code: 'R15-S1_KEA-Coaching-18Jul26__KEA_FreeCoaching_GS_18-07-2026', family: 'coaching', label: 'KEA free coaching · General Studies', date: '18 Jul 2026', year: 2026, qs: 100 },
    { code: 'R14-S1_BCWD-Coaching-15Nov25__BCWD_UPSC_Coaching_15-11-2025_GK', family: 'coaching', label: 'BCWD UPSC coaching · General Studies', date: '15 Nov 2025', year: 2025, qs: 100 },
    { code: 'R13-S1_Minority-Coaching-09Nov25__MinorityWelfare_UPSC_KPSC_Coaching_09-11-2025_GK', family: 'coaching', label: 'Minority Welfare UPSC/KPSC coaching · General Knowledge', date: '9 Nov 2025', year: 2025, qs: 98 },
    { code: 'R12-S1_GroupC-Coaching-19Jul25__GroupC_Banking_SSC_RRB_Coaching_Entrance_19-07-2025_GK', family: 'coaching', label: 'Group C, Banking, SSC & RRB coaching · General Knowledge', date: '19 Jul 2025', year: 2025, qs: 94 },
    { code: 'R11-S1_IAS-KAS-Coaching-04Jun25__IAS_KAS_Coaching_Entrance_04-06-2025_GS', family: 'coaching', label: 'IAS/KAS training institute · General Studies', date: '4 Jun 2025', year: 2025, qs: 100 },
    { code: 'R10-S1_SWD-Coaching-12Jan25__AKKA_FreeCoaching_SWD1201UP25_12-01-2025_GK', family: 'coaching', label: 'Social Welfare UPSC/KAS coaching · General Knowledge', date: '12 Jan 2025', year: 2025, qs: 100 },
    { code: 'R16-S1_FreeCoaching-GS-18Feb24__kea_free_coaching_gs_2024_a1', family: 'coaching', label: 'KEA free coaching · General Studies', date: '18 Feb 2024', year: 2024, qs: 100 },

    // KSET
    { code: 'R21-S1_KSET-P1-24Nov24__kset_2024_paper1_c1', family: 'kset', label: 'KSET · Paper 1 General Paper', date: '24 Nov 2024', year: 2024, qs: 50 },
];

export const isKeaFamily = (key: string): key is KeaFamily => KEA_FAMILIES.some((f) => f.key === key);

/** Exact paper codes behind a family key ("all" = every recruitment paper) or a single paper code. */
export function keaPaperCodes(key: string | undefined): string[] | null {
    if (!key) return null;
    // "All posts" is every recruitment paper; KSET is an eligibility test with its own marking (+2, no negative).
    if (key === 'all') return KEA_PAPERS.filter((p) => p.family !== 'kset').map((p) => p.code);
    if (key === 'tech-eng') key = 'engineering';   // key used before 13 Nov 2026
    if (isKeaFamily(key)) return KEA_PAPERS.filter((p) => p.family === key).map((p) => p.code);
    return [key];
}

export const keaPaper = (code: string | undefined) => KEA_PAPERS.find((p) => p.code === code);

export function keaFamilyStats(key: KeaFamily) {
    const ps = KEA_PAPERS.filter((p) => p.family === key);
    return { papers: ps.length, qs: ps.reduce((n, p) => n + p.qs, 0) };
}

/** Sort key for "newest first": the sitting date, or 1 Jan of its year when only a month is known. */
const MONTHS = ['jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
export function keaPaperTime(p: KeaPaper) {
    // Parsed by hand: Date.parse of "Feb 2023" differs between browsers.
    const m = p.date.match(/^(?:(\d{1,2}) )?([A-Za-z]{3})[a-z]* (\d{4})$/);
    if (!m) return Date.UTC(p.year, 0, 1);
    return Date.UTC(Number(m[3]), Math.max(0, MONTHS.indexOf(m[2].toLowerCase())), m[1] ? Number(m[1]) : 1);
}

/**
 * Subjects as practised: the table names some subjects two ways ("Communication Paper" and
 * "Communication Paper (General Kannada, …)"), which would split a drill in two. Each group lists every name it covers.
 */
export const KEA_SUBJECTS: { label: string; kn: string; names: string[] }[] = [
    { label: 'Communication: Kannada, English & Computer', kn: 'ಸಂವಹನ: ಕನ್ನಡ, ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಗಣಕಯಂತ್ರ', names: ['Communication Paper', 'Communication Paper (General Kannada, General English & Computer Knowledge)'] },
    { label: 'Language, grammar & comprehension', kn: 'ಭಾಷೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಗ್ರಹಿಕೆ', names: ['Language Proficiency, Grammar & Communication (General Kannada & General English)', 'Language Proficiency, Grammar & Communication'] },
    { label: 'Mental ability & quantitative aptitude', kn: 'ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ', names: ['General Mental Ability, Quantitative Aptitude & Comprehension'] },
    { label: 'History', kn: 'ಇತಿಹಾಸ', names: ['History'] },
    { label: 'Science, technology & defence', kn: 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', names: ['Science, Technology & Defence'] },
    { label: 'Polity, Constitution & governance', kn: 'ರಾಜ್ಯವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', names: ['Indian Polity, Constitution & Governance'] },
    { label: 'Geography', kn: 'ಭೂಗೋಳಶಾಸ್ತ್ರ', names: ['Geography & Earth Systems'] },
    { label: 'Economy & development', kn: 'ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', names: ['Indian Economy & Development'] },
    { label: 'Environment & disaster management', kn: 'ಪರಿಸರ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', names: ['Environment, Ecology & Disaster Management'] },
    { label: 'Society & social justice', kn: 'ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', names: ['Indian Society & Social Justice'] },
    { label: 'Art, culture & heritage', kn: 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', names: ['Art, Culture & Heritage'] },
    { label: 'General knowledge', kn: 'ಸಾಮಾನ್ಯ ಜ್ಞಾನ', names: ['General Knowledge', 'General Knowledge (Miscellaneous)'] },
    { label: 'Sports', kn: 'ಕ್ರೀಡೆಗಳು', names: ['Sports'] },
    { label: 'International relations', kn: 'ಅಂತರರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು', names: ['International Relations & Global Institutions'] },
    { label: 'Labour laws & industrial relations', kn: 'ಕಾರ್ಮಿಕ ಕಾನೂನುಗಳು ಮತ್ತು ಕೈಗಾರಿಕಾ ಸಂಬಂಧಗಳು', names: ['Industrial Relations & Labour Laws'] },
    { label: 'Social security', kn: 'ಸಾಮಾಜಿಕ ಭದ್ರತೆ', names: ['Social Security in India'] },
    { label: 'Educational psychology & pedagogy', kn: 'ಶೈಕ್ಷಣಿಕ ಮನೋವಿಜ್ಞಾನ ಮತ್ತು ಬೋಧನಾಶಾಸ್ತ್ರ', names: ['Educational Psychology, Child Development & Teaching Pedagogy'] },
    { label: 'Ethics & integrity', kn: 'ನೀತಿಶಾಸ್ತ್ರ ಮತ್ತು ಪ್ರಾಮಾಣಿಕತೆ', names: ['Ethics, Integrity & Aptitude'] },
    { label: 'Internal security', kn: 'ಆಂತರಿಕ ಭದ್ರತೆ', names: ['Internal Security'] },
    { label: 'Applied statistics', kn: 'ಅನ್ವಯಿಕ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', names: ['Applied Statistics'] },
    { label: 'Insurance', kn: 'ವಿಮೆ', names: ['Insurance'] },
];

/** Table subject names behind a practised subject; a name that isn't a group is matched as is. */
export const keaSubjectNames = (label: string) => KEA_SUBJECTS.find((g) => g.label === label)?.names ?? [label];

/** Subject group for a table subject name (null for untagged questions). */
export const keaSubjectOf = (name: string | null) => (name ? KEA_SUBJECTS.find((g) => g.names.includes(name)) ?? null : null);

const KN_MONTHS: Record<string, string> = {
    Jan: 'ಜನವರಿ', Feb: 'ಫೆಬ್ರವರಿ', Mar: 'ಮಾರ್ಚ್', Apr: 'ಏಪ್ರಿಲ್', May: 'ಮೇ', Jun: 'ಜೂನ್',
    Jul: 'ಜುಲೈ', Aug: 'ಆಗಸ್ಟ್', Sep: 'ಸೆಪ್ಟೆಂಬರ್', Oct: 'ಅಕ್ಟೋಬರ್', Nov: 'ನವೆಂಬರ್', Dec: 'ಡಿಸೆಂಬರ್',
};
/** "22 Feb 2026" → "22 ಫೆಬ್ರವರಿ 2026" in Kannada. */
export const keaDate = (date: string, lang: string) => (lang === 'kn' ? date.replace(/\b([A-Z][a-z]{2})\b/, (m) => KN_MONTHS[m] ?? m) : date);

// Common words in paper names, in Kannada. Proper names (KRIDL, BMTC, GTTC…) stay as they are.
const KN_TERMS: [RegExp, string][] = [
    [/Paper 2 Kannada, English & Computer/g, 'ಪತ್ರಿಕೆ 2 ಕನ್ನಡ, ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಗಣಕಯಂತ್ರ'],
    [/Kannada, English & Computer/g, 'ಕನ್ನಡ, ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಗಣಕಯಂತ್ರ'],
    [/Kannada & English/g, 'ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್'],
    [/General Knowledge & Aptitude/g, 'ಸಾಮಾನ್ಯ ಜ್ಞಾನ ಮತ್ತು ಅಭಿರುಚಿ'],
    [/General Knowledge/g, 'ಸಾಮಾನ್ಯ ಜ್ಞಾನ'],
    [/General Studies/g, 'ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ'],
    [/General Paper/g, 'ಸಾಮಾನ್ಯ ಪತ್ರಿಕೆ'],
    [/Compulsory Kannada/g, 'ಕಡ್ಡಾಯ ಕನ್ನಡ'],
    [/Communication/g, 'ಸಂವಹನ'],
    [/Labour Law/g, 'ಕಾರ್ಮಿಕ ಕಾನೂನು'],
    [/Paper (\d)/g, 'ಪತ್ರಿಕೆ $1'],
    [/Specific/g, 'ನಿರ್ದಿಷ್ಟ'],
    [/\(Kalyana Karnataka\)/g, '(ಕಲ್ಯಾಣ ಕರ್ನಾಟಕ)'],
    [/\(Non-HK\)/g, '(ಉಳಿಕೆ ಮೂಲ ವೃಂದ)'],
    [/\(2nd sitting\)/g, '(ಎರಡನೇ ಬಾರಿ)'],
    [/\(post not stated\)/g, '(ಹುದ್ದೆ ತಿಳಿಸಿಲ್ಲ)'],
    [/\bFDA\b/g, 'ಪ್ರಥಮ ದರ್ಜೆ ಸಹಾಯಕ'],
    [/\bSDA\b/g, 'ದ್ವಿತೀಯ ದರ್ಜೆ ಸಹಾಯಕ'],
    [/Civil Police Constable/g, 'ಸಿವಿಲ್ ಪೊಲೀಸ್ ಕಾನ್‌ಸ್ಟೇಬಲ್'],
    [/Police Constable/g, 'ಪೊಲೀಸ್ ಕಾನ್‌ಸ್ಟೇಬಲ್'],
    [/Police Sub-Inspector/g, 'ಪೊಲೀಸ್ ಸಬ್-ಇನ್‌ಸ್ಪೆಕ್ಟರ್'],
    [/Assistant Engineer/g, 'ಸಹಾಯಕ ಎಂಜಿನಿಯರ್'],
    [/Junior Engineer/g, 'ಕಿರಿಯ ಎಂಜಿನಿಯರ್'],
    [/Range Forest Officer/g, 'ವಲಯ ಅರಣ್ಯಾಧಿಕಾರಿ'],
    [/\bVAO\b/g, 'ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ'],
];
/** Paper name in the reader's language (common terms translated; proper names kept). */
export function keaPaperName(label: string, lang: string) {
    if (lang !== 'kn') return label;
    return KN_TERMS.reduce((s, [re, kn]) => s.replace(re, kn), label);
}

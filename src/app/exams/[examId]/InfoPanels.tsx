'use client';
import { ChevronRight, ArrowRight } from 'lucide-react';
import type { ExamInfo } from '@/data/examDetails';
import { KEA_FAMILIES, KEA_PAPERS, keaPaperTime, keaFamilyName, keaPaperName, keaDate, type KeaFamily } from '@/lib/keaPapers';

type Lang = 'en' | 'hi' | 'kn';
export type KeaInfo = {
    family: string;
    onFamily: (f: KeaFamily | 'all') => void;
    /** count = all questions; gen / lng = in general papers / in language papers */
    subjects: { label: string; kn: string; count: number; gen: number; lng: number }[] | null;
    onSit: (code: string) => void;
};

const pick = (lang: Lang, en: string, kn?: string) => (lang === 'kn' && kn ? kn : en);

function Faqs({ info, lang }: { info: ExamInfo; lang: Lang }) {
    if (!info.faqs?.length) return null;
    return (
        <section className="xd-info-sec" aria-labelledby="xd-faq-h">
            <h2 id="xd-faq-h" className="xd-info-h">{lang === 'kn' ? 'ಸಾಮಾನ್ಯ ಪ್ರಶ್ನೆಗಳು' : 'Frequently asked questions'}</h2>
            {info.faqs.map((faq, i) => (
                <details key={i} className="xd-faq">
                    <summary>{pick(lang, faq.question, faq.question_kn)}<ChevronRight size={18} /></summary>
                    <p>{pick(lang, faq.answer, faq.answer_kn)}</p>
                </details>
            ))}
        </section>
    );
}

function Overview({ info, lang }: { info: ExamInfo; lang: Lang }) {
    return (
        <section className="xd-info-sec" aria-labelledby="xd-ov-h">
            <h2 id="xd-ov-h" className="xd-info-h">{lang === 'kn' ? 'ಪರಿಚಯ' : 'Overview'}</h2>
            <p className="xd-info-p">{pick(lang, info.overview, info.overview_kn)}</p>
            <dl className="xd-facts">
                <div><dt>{lang === 'kn' ? 'ನಡೆಸುವವರು' : 'Conducted by'}</dt><dd>{pick(lang, info.conductingBody, info.conductingBody_kn)}</dd></div>
            </dl>
        </section>
    );
}

/* ── KEA: the pattern of each post, computed from its papers ── */
const KT = {
    en: {
        papersByPost: 'Papers by post',
        intro: (kset: boolean) => `Every KEA paper here is objective (four options, one correct) and runs 120 minutes. ${kset ? 'KSET Paper 1 carries 2 marks a question with no negative marking.' : 'Each question carries 1 mark, and a quarter mark is deducted for a wrong answer.'} Pay, age limits and eligibility differ by post and by notification; check the notification for your post.`,
        caption: (post: string, hint: string, n: number) => `${post}: ${hint}. ${n} ${n === 1 ? 'paper' : 'papers'}, newest first.`,
        allCaption: 'Every post in this archive. Choose one to see its papers.',
        date: 'Date', paper: 'Paper', post: 'Post', papers: 'Papers', questions: 'Questions',
        sit: 'Sit this paper', sitShort: 'Sit', practise: 'Practise', view: 'See papers',
        qs: (n: number) => `${n.toLocaleString('en-IN')} questions`,
        ask: 'What these papers ask',
        counting: 'Counting questions by subject…',
        askIntro: (post: string) => `Questions ${post === 'All posts' ? 'across every post' : `in the ${post} papers`}, by subject. General papers and language papers are counted separately, because a post usually sits one of each.`,
        general: 'General papers', language: 'Language papers: Kannada, English & computer',
        subject: 'Subject', share: 'Share',
    },
    kn: {
        papersByPost: 'ಹುದ್ದೆವಾರು ಪತ್ರಿಕೆಗಳು',
        intro: (kset: boolean) => `ಇಲ್ಲಿರುವ ಪ್ರತಿ KEA ಪತ್ರಿಕೆಯೂ ವಸ್ತುನಿಷ್ಠ (ನಾಲ್ಕು ಆಯ್ಕೆಗಳು, ಒಂದು ಸರಿ) ಮತ್ತು 120 ನಿಮಿಷಗಳದ್ದು. ${kset ? 'ಕೆ-ಸೆಟ್ ಪತ್ರಿಕೆ 1ರಲ್ಲಿ ಪ್ರತಿ ಪ್ರಶ್ನೆಗೆ 2 ಅಂಕಗಳು, ಋಣಾತ್ಮಕ ಅಂಕಗಳಿಲ್ಲ.' : 'ಪ್ರತಿ ಪ್ರಶ್ನೆಗೆ 1 ಅಂಕ; ತಪ್ಪು ಉತ್ತರಕ್ಕೆ ಕಾಲು ಅಂಕ ಕಳೆಯಲಾಗುತ್ತದೆ.'} ವೇತನ, ವಯೋಮಿತಿ ಮತ್ತು ಅರ್ಹತೆ ಹುದ್ದೆ ಮತ್ತು ಅಧಿಸೂಚನೆಯಿಂದ ಬದಲಾಗುತ್ತವೆ; ನಿಮ್ಮ ಹುದ್ದೆಯ ಅಧಿಸೂಚನೆಯನ್ನು ನೋಡಿ.`,
        caption: (post: string, _hint: string, n: number) => `${post}: ${n} ಪತ್ರಿಕೆಗಳು, ಇತ್ತೀಚಿನವು ಮೊದಲು.`,
        allCaption: 'ಈ ಸಂಗ್ರಹದ ಎಲ್ಲಾ ಹುದ್ದೆಗಳು. ಪತ್ರಿಕೆಗಳನ್ನು ನೋಡಲು ಒಂದನ್ನು ಆರಿಸಿ.',
        date: 'ದಿನಾಂಕ', paper: 'ಪತ್ರಿಕೆ', post: 'ಹುದ್ದೆ', papers: 'ಪತ್ರಿಕೆಗಳು', questions: 'ಪ್ರಶ್ನೆಗಳು',
        sit: 'ಈ ಪತ್ರಿಕೆ ಬರೆಯಿರಿ', sitShort: 'ಬರೆಯಿರಿ', practise: 'ಅಭ್ಯಾಸ', view: 'ಪತ್ರಿಕೆಗಳು',
        qs: (n: number) => `${n.toLocaleString('en-IN')} ಪ್ರಶ್ನೆಗಳು`,
        ask: 'ಈ ಪತ್ರಿಕೆಗಳು ಏನು ಕೇಳುತ್ತವೆ',
        counting: 'ವಿಷಯವಾರು ಪ್ರಶ್ನೆಗಳನ್ನು ಎಣಿಸಲಾಗುತ್ತಿದೆ…',
        askIntro: (post: string) => `${post} ಪತ್ರಿಕೆಗಳಲ್ಲಿನ ಪ್ರಶ್ನೆಗಳು, ವಿಷಯವಾರು. ಸಾಮಾನ್ಯ ಪತ್ರಿಕೆಗಳು ಮತ್ತು ಭಾಷಾ ಪತ್ರಿಕೆಗಳನ್ನು ಪ್ರತ್ಯೇಕವಾಗಿ ಎಣಿಸಲಾಗಿದೆ.`,
        general: 'ಸಾಮಾನ್ಯ ಪತ್ರಿಕೆಗಳು', language: 'ಭಾಷಾ ಪತ್ರಿಕೆಗಳು: ಕನ್ನಡ, ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಗಣಕಯಂತ್ರ',
        subject: 'ವಿಷಯ', share: 'ಪಾಲು',
    },
};
const kt = (lang: Lang) => (lang === 'kn' ? KT.kn : KT.en);
const pct = (n: number, total: number) => (!total ? '—' : n / total < 0.005 ? '<1%' : `${Math.round((n / total) * 100)}%`);
const FAMILY_KEYS: (KeaFamily | 'all')[] = [...KEA_FAMILIES.map(f => f.key), 'all'];

function SubjectTable({ rows, title, lang }: { rows: { label: string; kn: string; n: number }[]; title: string; lang: Lang }) {
    const t = kt(lang);
    const total = rows.reduce((n, s) => n + s.n, 0);
    return (
        <div className="xd-table-wrap">
            <table className="xd-table">
                <caption>{title}: {t.qs(total)}</caption>
                <thead><tr><th scope="col">{t.subject}</th><th scope="col" className="xd-num">{t.questions}</th><th scope="col" className="xd-num">{t.share}</th></tr></thead>
                <tbody>
                    {rows.map(s => (
                        <tr key={s.label}>
                            <td>{lang === 'kn' ? s.kn : s.label}</td>
                            <td className="xd-num">{s.n.toLocaleString('en-IN')}</td>
                            <td className="xd-num">{pct(s.n, total)}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

function KeaPattern({ kea, lang }: { kea: KeaInfo; lang: Lang }) {
    const t = kt(lang);
    const family: KeaFamily | 'all' = FAMILY_KEYS.includes(kea.family as KeaFamily) ? (kea.family as KeaFamily | 'all') : 'fda-sda';
    const isAll = family === 'all';
    const postName = keaFamilyName(family, lang);
    const meta = KEA_FAMILIES.find(f => f.key === family);
    const papers = KEA_PAPERS.filter(p => p.family === family).sort((a, b) => keaPaperTime(b) - keaPaperTime(a));
    const subjects = kea.family === family ? kea.subjects : null;
    const gen = (subjects ?? []).filter(s => s.gen > 0).map(s => ({ label: s.label, kn: s.kn, n: s.gen })).sort((a, b) => b.n - a.n);
    const lng = (subjects ?? []).filter(s => s.lng > 0).map(s => ({ label: s.label, kn: s.kn, n: s.lng })).sort((a, b) => b.n - a.n);
    return (
        <>
            <section className="xd-info-sec" aria-labelledby="xd-pat-h">
                <h2 id="xd-pat-h" className="xd-info-h">{t.papersByPost}</h2>
                <p className="xd-info-p">{t.intro(family === 'kset')}</p>
                <div className="xd-chips" role="group" aria-label={t.post}>
                    {FAMILY_KEYS.map(k => (
                        <button key={k} type="button" className="xd-chip" aria-pressed={family === k} onClick={() => kea.onFamily(k)}>
                            <span>{keaFamilyName(k, lang)}</span>
                        </button>
                    ))}
                </div>
                <div className="xd-table-wrap">
                    {isAll ? (
                        <table className="xd-table">
                            <caption>{t.allCaption}</caption>
                            <thead><tr><th scope="col">{t.post}</th><th scope="col" className="xd-num">{t.papers}</th><th scope="col" className="xd-num">{t.questions}</th><th scope="col"><span className="sr-only">{t.view}</span></th></tr></thead>
                            <tbody>
                                {KEA_FAMILIES.map(f => {
                                    const ps = KEA_PAPERS.filter(p => p.family === f.key);
                                    return (
                                        <tr key={f.key}>
                                            <td>{keaFamilyName(f.key, lang)}</td>
                                            <td className="xd-num">{ps.length}</td>
                                            <td className="xd-num">{ps.reduce((n, p) => n + p.qs, 0).toLocaleString('en-IN')}</td>
                                            <td className="xd-act">
                                                <button type="button" className="xd-text-link" onClick={() => kea.onFamily(f.key)}>{t.view} <ArrowRight size={15} /></button>
                                            </td>
                                        </tr>
                                    );
                                })}
                            </tbody>
                        </table>
                    ) : (
                        <table className="xd-table">
                            <caption>{t.caption(postName, meta?.hint ?? '', papers.length)}</caption>
                            <thead><tr><th scope="col" className="xd-wide">{t.date}</th><th scope="col">{t.paper}</th><th scope="col"><span className="sr-only">{t.practise}</span></th></tr></thead>
                            <tbody>
                                {papers.map(p => {
                                    const name = keaPaperName(p.label, lang);
                                    const date = keaDate(p.date, lang);
                                    return (
                                        <tr key={p.code}>
                                            <td className="xd-nowrap xd-wide">{date}</td>
                                            <td>
                                                {name}
                                                <span className="xd-cell-sub xd-narrow-block">{date}</span>
                                                {p.qs !== 100 && <span className="xd-cell-sub">{t.qs(p.qs)}</span>}
                                            </td>
                                            <td className="xd-act">
                                                <button type="button" className="xd-text-link" onClick={() => kea.onSit(p.code)} aria-label={`${t.sit}: ${name}, ${date}`}>
                                                    <span className="xd-wide-inline">{t.sit}</span><span className="xd-narrow-inline">{t.sitShort}</span> <ArrowRight size={15} />
                                                </button>
                                            </td>
                                        </tr>
                                    );
                                })}
                            </tbody>
                        </table>
                    )}
                </div>
            </section>

            <section className="xd-info-sec" aria-labelledby="xd-sub-h">
                <h2 id="xd-sub-h" className="xd-info-h">{t.ask}</h2>
                {!subjects ? (
                    <p className="xd-info-p xd-muted">{t.counting}</p>
                ) : (
                    <>
                        <p className="xd-info-p">{t.askIntro(postName)}</p>
                        {gen.length > 0 && <SubjectTable rows={gen} title={t.general} lang={lang} />}
                        {lng.length > 0 && <SubjectTable rows={lng} title={t.language} lang={lang} />}
                    </>
                )}
            </section>
        </>
    );
}

/* ── Every other exam: its official stages, eligibility and syllabus focus ── */
function Pattern({ info }: { info: ExamInfo }) {
    return (
        <section className="xd-info-sec" aria-labelledby="xd-pat-h">
            <h2 id="xd-pat-h" className="xd-info-h">Exam pattern</h2>
            {info.stages.map(stg => (
                <div key={stg.stageNumber} className="xd-stage">
                    <h3 className="xd-info-h3">
                        {info.stages.length > 1 ? `Stage ${stg.stageNumber}: ` : ''}{stg.stageName}
                        <span>{stg.totalMarks > 0 ? `${stg.totalMarks} marks` : 'Qualifying'}</span>
                    </h3>
                    <p className="xd-info-p">{stg.description}</p>
                    {stg.papers.length > 0 && (
                        <div className="xd-table-wrap">
                            <table className="xd-table">
                                <thead><tr>
                                    <th scope="col">Paper</th><th scope="col" className="xd-num">Questions</th><th scope="col" className="xd-num">Marks</th>
                                    <th scope="col" className="xd-num">Time</th><th scope="col">Negative marking</th>
                                </tr></thead>
                                <tbody>
                                    {stg.papers.map((p, i) => (
                                        <tr key={i}>
                                            <td>{p.paperName}{p.subjects.length > 0 && <span className="xd-cell-sub">{p.subjects.join(' · ')}</span>}</td>
                                            <td className="xd-num">{p.questionsCount ?? '—'}</td>
                                            <td className="xd-num">{p.marks}</td>
                                            <td className="xd-num xd-nowrap">{p.durationMinutes} min</td>
                                            <td>{p.negativeMarking}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    )}
                </div>
            ))}
        </section>
    );
}

function Eligibility({ info }: { info: ExamInfo }) {
    const e = info.eligibility;
    if (!e) return null;
    const ages: [string, string | undefined][] = [
        ['General', e.ageLimit.general], ['OBC (non-creamy layer)', e.ageLimit.obc], ['SC / ST', e.ageLimit.sc_st],
        ['Category 2A, 2B, 3A, 3B', e.ageLimit.obc_2a_2b_3a_3b], ['SC / ST / Category 1', e.ageLimit.sc_st_cat1],
    ];
    return (
        <section className="xd-info-sec" aria-labelledby="xd-el-h">
            <h2 id="xd-el-h" className="xd-info-h">Eligibility</h2>
            <dl className="xd-facts">
                {ages.filter(([, v]) => v).map(([k, v]) => <div key={k}><dt>Age: {k}</dt><dd>{v}</dd></div>)}
                <div><dt>Education</dt><dd>{e.educationalQualification}</dd></div>
                {e.attemptsAllowed && <div><dt>Attempts</dt><dd>{e.attemptsAllowed}</dd></div>}
            </dl>
            {e.physicalStandards?.length ? (
                <>
                    <h3 className="xd-info-h3">Physical standards</h3>
                    <ul className="xd-list">{e.physicalStandards.map((x, i) => <li key={i}>{x}</li>)}</ul>
                </>
            ) : null}
        </section>
    );
}

function SyllabusFocus({ info, onOpenMap }: { info: ExamInfo; onOpenMap?: () => void }) {
    if (!info.syllabusFocus?.length) return null;
    return (
        <section className="xd-info-sec" aria-labelledby="xd-foc-h">
            <h2 id="xd-foc-h" className="xd-info-h">Syllabus focus</h2>
            <dl className="xd-focus">
                {info.syllabusFocus.map((f, i) => (
                    <div key={i}><dt>{f.pillarName} <span>{f.weightage} weightage</span></dt><dd>{f.topics.join(' · ')}</dd></div>
                ))}
            </dl>
            {onOpenMap && (
                <button type="button" className="xd-text-link" onClick={onOpenMap}>Open the full syllabus map <ArrowRight size={15} /></button>
            )}
        </section>
    );
}

export function AboutPanel({ info, lang, kea, onOpenMap }: { info: ExamInfo; lang: Lang; kea?: KeaInfo; onOpenMap?: () => void }) {
    return (
        <div id="xd-panel-about" role="tabpanel" aria-labelledby="xd-tab-about" className="xd-panel xd-info">
            <Overview info={info} lang={lang} />
            {kea ? <KeaPattern kea={kea} lang={lang} /> : <>
                <Pattern info={info} />
                <Eligibility info={info} />
                <SyllabusFocus info={info} onOpenMap={onOpenMap} />
            </>}
            <Faqs info={info} lang={lang} />
        </div>
    );
}

/* ── Services & roles ── */
function KeaPosts() {
    return (
        <>
            <section className="xd-info-sec" aria-labelledby="xd-posts-h">
                <h2 id="xd-posts-h" className="xd-info-h">Posts in this archive</h2>
                <p className="xd-info-p">KEA runs recruitment for many departments, boards and corporations. These are the posts whose papers you can practise here.</p>
                <dl className="xd-focus">
                    {KEA_FAMILIES.map(f => {
                        const ps = KEA_PAPERS.filter(p => p.family === f.key);
                        const posts = [...new Set(ps.map(p => p.label.split(' · ')[0]))];
                        const years = ps.map(p => p.year);
                        const span = Math.min(...years) === Math.max(...years) ? `${years[0]}` : `${Math.min(...years)}–${Math.max(...years)}`;
                        return (
                            <div key={f.key}>
                                <dt>{f.label} <span>{ps.length} {ps.length === 1 ? 'paper' : 'papers'}, {span}</span></dt>
                                <dd>{posts.join(' · ')}</dd>
                            </div>
                        );
                    })}
                </dl>
            </section>
            <section className="xd-info-sec" aria-labelledby="xd-pay-h">
                <h2 id="xd-pay-h" className="xd-info-h">Pay, age limits and eligibility</h2>
                <p className="xd-info-p">These differ for every post and change with each recruitment notification, so they aren&apos;t listed here. Check the notification for your post before you apply.</p>
            </section>
        </>
    );
}

export function ServicesPanel({ info, lang, kea }: { info: ExamInfo; lang: Lang; kea?: boolean }) {
    const j = info.jobRole;
    if (!j && !kea) return null;
    return (
        <div id="xd-panel-services" role="tabpanel" aria-labelledby="xd-tab-services" className="xd-panel xd-info">
            {kea || !j ? <KeaPosts /> : <>
                {info.allocatedServices?.length ? (
                    <section className="xd-info-sec" aria-labelledby="xd-srv-h">
                        <h2 id="xd-srv-h" className="xd-info-h">Services allotted</h2>
                        <p className="xd-info-p">Candidates are allotted to these {info.allocatedServices.length} services by final rank and the preferences they state.</p>
                        <ul className="xd-services">
                            {info.allocatedServices.map(srv => (
                                <li key={srv.serviceCode}>
                                    <h3 className="xd-info-h3">{pick(lang, srv.serviceName, srv.serviceName_kn)} <span>{srv.serviceCode} · {srv.group}</span></h3>
                                    <p className="xd-info-p">{srv.roleDescription}</p>
                                    <dl className="xd-facts xd-facts-compact">
                                        <div><dt>Department</dt><dd>{srv.department}</dd></div>
                                        <div><dt>Joins as</dt><dd>{srv.entryDesignation}</dd></div>
                                        <div><dt>Highest post</dt><dd>{srv.careerApex}</dd></div>
                                    </dl>
                                </li>
                            ))}
                        </ul>
                    </section>
                ) : null}

                <section className="xd-info-sec" aria-labelledby="xd-role-h">
                    <h2 id="xd-role-h" className="xd-info-h">The role</h2>
                    <dl className="xd-facts">
                        <div><dt>Designation</dt><dd>{pick(lang, j.designation, j.designation_kn)}</dd></div>
                        <div><dt>Cadre</dt><dd>{j.cadre}</dd></div>
                        <div><dt>Department</dt><dd>{pick(lang, j.department, j.department_kn)}</dd></div>
                        <div><dt>Posting</dt><dd>{j.postingLocations}</dd></div>
                    </dl>
                    <h3 className="xd-info-h3">Responsibilities</h3>
                    <ul className="xd-list">{(lang === 'kn' && j.keyResponsibilities_kn?.length ? j.keyResponsibilities_kn : j.keyResponsibilities).map((r, i) => <li key={i}>{r}</li>)}</ul>
                    {j.careerProgression.length > 0 && <>
                        <h3 className="xd-info-h3">Career progression</h3>
                        <ol className="xd-list">{j.careerProgression.map((step, i) => <li key={i}>{step}</li>)}</ol>
                    </>}
                </section>

                <section className="xd-info-sec" aria-labelledby="xd-pay-h">
                    <h2 id="xd-pay-h" className="xd-info-h">Pay and benefits</h2>
                    <dl className="xd-facts">
                        <div><dt>Pay level</dt><dd>{j.payScale.level}</dd></div>
                        <div><dt>Basic pay</dt><dd>{j.payScale.basicPayRange}</dd></div>
                        <div><dt>Approximate monthly gross</dt><dd>{j.payScale.approxMonthlyGross}</dd></div>
                    </dl>
                    {j.payScale.perks.length > 0 && <ul className="xd-list">{j.payScale.perks.map((p, i) => <li key={i}>{p}</li>)}</ul>}
                </section>
            </>}
        </div>
    );
}

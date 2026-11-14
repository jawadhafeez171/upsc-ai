'use client';
import { ChevronRight, ArrowRight } from 'lucide-react';
import type { ExamInfo } from '@/data/examDetails';
import { KEA_FAMILIES, KEA_PAPERS, keaPaperTime, keaFamilyName, type KeaFamily } from '@/lib/keaPapers';

type Lang = 'en' | 'hi' | 'kn';
export type KeaInfo = {
    family: string;
    onFamily: (f: KeaFamily) => void;
    subjects: { label: string; kn: string; count: number }[] | null;
    onSit: (code: string) => void;
};

const pick = (lang: Lang, en: string, kn?: string) => (lang === 'kn' && kn ? kn : en);

function Faqs({ info }: { info: ExamInfo }) {
    if (!info.faqs?.length) return null;
    return (
        <section className="xd-info-sec" aria-labelledby="xd-faq-h">
            <h2 id="xd-faq-h" className="xd-info-h">Frequently asked questions</h2>
            {info.faqs.map((faq, i) => (
                <details key={i} className="xd-faq">
                    <summary>{faq.question}<ChevronRight size={18} /></summary>
                    <p>{faq.answer}</p>
                </details>
            ))}
        </section>
    );
}

function Overview({ info, lang }: { info: ExamInfo; lang: Lang }) {
    return (
        <section className="xd-info-sec" aria-labelledby="xd-ov-h">
            <h2 id="xd-ov-h" className="xd-info-h">Overview</h2>
            <p className="xd-info-p">{pick(lang, info.overview, info.overview_kn)}</p>
            <dl className="xd-facts">
                <div><dt>Conducted by</dt><dd>{pick(lang, info.conductingBody, info.conductingBody_kn)}</dd></div>
            </dl>
        </section>
    );
}

/* ── KEA: the pattern of each post, computed from its papers ── */
function KeaPattern({ kea, lang }: { kea: KeaInfo; lang: Lang }) {
    const family: KeaFamily = KEA_FAMILIES.some(f => f.key === kea.family) ? (kea.family as KeaFamily) : 'fda-sda';
    const meta = KEA_FAMILIES.find(f => f.key === family)!;
    const papers = KEA_PAPERS.filter(p => p.family === family).sort((a, b) => keaPaperTime(b) - keaPaperTime(a));
    const sameFamily = kea.family === family;
    const total = kea.subjects?.reduce((n, s) => n + s.count, 0) ?? 0;
    return (
        <>
            <section className="xd-info-sec" aria-labelledby="xd-pat-h">
                <h2 id="xd-pat-h" className="xd-info-h">Papers by post</h2>
                <p className="xd-info-p">
                    Every KEA paper here is objective: four options, one correct, 120 minutes.{' '}
                    {family === 'kset'
                        ? 'KSET Paper 1 carries 2 marks a question with no negative marking.'
                        : 'Each question carries 1 mark, and a quarter mark is deducted for a wrong answer.'}
                    {' '}Pay, age limits and eligibility differ by post and by notification; check the notification for your post.
                </p>
                <div className="xd-chips" role="group" aria-label="Post">
                    {KEA_FAMILIES.map(f => (
                        <button key={f.key} type="button" className="xd-chip" aria-pressed={family === f.key} onClick={() => kea.onFamily(f.key)}>
                            <span>{keaFamilyName(f.key, lang)}</span>
                        </button>
                    ))}
                </div>
                <div className="xd-table-wrap">
                    <table className="xd-table">
                        <caption>{keaFamilyName(family, lang)}: {meta.hint}. {papers.length} {papers.length === 1 ? 'paper' : 'papers'}, newest first.</caption>
                        <thead><tr>
                            <th scope="col">Date</th><th scope="col">Paper</th><th scope="col" className="xd-num xd-wide">Questions</th>
                            <th scope="col" className="xd-num xd-wide">Time</th><th scope="col"><span className="sr-only">Practise</span></th>
                        </tr></thead>
                        <tbody>
                            {papers.map(p => (
                                <tr key={p.code}>
                                    <td className="xd-nowrap">{p.date}</td>
                                    <td>{p.label}</td>
                                    <td className="xd-num xd-wide">{p.qs}</td>
                                    <td className="xd-num xd-nowrap xd-wide">120 min</td>
                                    <td className="xd-act">
                                        <button type="button" className="xd-text-link" onClick={() => kea.onSit(p.code)} aria-label={`Sit ${p.label}, ${p.date}`}>
                                            <span className="xd-wide-inline">Sit this paper</span><span className="xd-narrow-inline">Sit</span> <ArrowRight size={15} />
                                        </button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </section>

            <section className="xd-info-sec" aria-labelledby="xd-sub-h">
                <h2 id="xd-sub-h" className="xd-info-h">What these papers ask</h2>
                {!sameFamily || !kea.subjects ? (
                    <p className="xd-info-p xd-muted">Counting questions by subject…</p>
                ) : (
                    <>
                        <p className="xd-info-p">Questions in the {keaFamilyName(family, lang)} papers, by subject. Use this to decide where your practice time goes.</p>
                        <div className="xd-table-wrap">
                            <table className="xd-table">
                                <thead><tr><th scope="col">Subject</th><th scope="col" className="xd-num">Questions</th><th scope="col" className="xd-num">Share</th></tr></thead>
                                <tbody>
                                    {kea.subjects.map(s => (
                                        <tr key={s.label}>
                                            <td>{lang === 'kn' ? s.kn : s.label}</td>
                                            <td className="xd-num">{s.count.toLocaleString('en-IN')}</td>
                                            <td className="xd-num">{!total ? '—' : s.count / total < 0.005 ? '<1%' : `${Math.round((s.count / total) * 100)}%`}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
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
            <Faqs info={info} />
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

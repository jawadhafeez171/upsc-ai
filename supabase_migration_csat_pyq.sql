-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: UPSC CSE Prelims Paper 2 (CSAT) PYQ Table
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.csat_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL DEFAULT 2020,
    paper INTEGER NOT NULL DEFAULT 2,
    exam_id TEXT NOT NULL DEFAULT 'upsc-cse',
    node_id TEXT NOT NULL,
    subject TEXT NOT NULL,
    subject_hindi TEXT,
    domain TEXT NOT NULL,
    domain_hindi TEXT,
    sub_topic TEXT NOT NULL,
    sub_topic_hindi TEXT,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
    tags TEXT[],
    question_english TEXT NOT NULL,
    question_hindi TEXT,
    option_a_english TEXT NOT NULL,
    option_b_english TEXT NOT NULL,
    option_c_english TEXT NOT NULL,
    option_d_english TEXT NOT NULL,
    option_a_hindi TEXT,
    option_b_hindi TEXT,
    option_c_hindi TEXT,
    option_d_hindi TEXT,
    key_answer TEXT NOT NULL,
    explanation_english TEXT NOT NULL,
    explanation_hindi TEXT,
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security (RLS)
ALTER TABLE public.csat_pyq ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access on csat_pyq"
    ON public.csat_pyq FOR SELECT
    USING (true);

CREATE POLICY "Allow anon insert on csat_pyq"
    ON public.csat_pyq FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Allow anon update on csat_pyq"
    ON public.csat_pyq FOR UPDATE
    USING (true);

-- Optimized Performance Indexes
CREATE INDEX IF NOT EXISTS idx_csat_pyq_year ON public.csat_pyq(year);
CREATE INDEX IF NOT EXISTS idx_csat_pyq_paper ON public.csat_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_csat_pyq_node_id ON public.csat_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_csat_pyq_domain ON public.csat_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_csat_pyq_difficulty ON public.csat_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_csat_pyq_exam_id ON public.csat_pyq(exam_id);

-- Seed Data: 2020 CSAT Questions (Q1 to Q80)
INSERT INTO public.csat_pyq (
    id, question_number, year, paper, exam_id, node_id, subject, subject_hindi,
    domain, domain_hindi, sub_topic, sub_topic_hindi, difficulty, tags,
    question_english, question_hindi, option_a_english, option_b_english,
    option_c_english, option_d_english, option_a_hindi, option_b_hindi,
    option_c_hindi, option_d_hindi, key_answer, explanation_english,
    explanation_hindi, image_url
) VALUES
    ('csat-2020-q1', 1, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Passage Inference & Central Idea (Employment & Social Sector Spending)', 'परिच्छेद निष्कर्ष एवं केंद्रीय विचार (रोज़गार एवं सामाजिक क्षेत्र व्यय)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Employment Generation', 'Social Sector']::TEXT[], 'Which one of the following is best implied in the passage?', 'परिच्छेद में निम्नलिखित में से कौन-सा एक सर्वाधिक महत्त्वपूर्ण निहितार्थ है?', 'Strong measures need to be taken to reduce the rural to urban migration of labour.', 'The working condition in construction and unregistered manufacturing needs to be improved.', 'Service sector has been reducing the problem of unemployment.', 'Increased social sector spending is imperative for large-scale job creation.', 'ग्रामीण से शहरी क्षेत्र में श्रमिकों का प्रवसन कम करने के लिए कड़े कदम उठाने की आवश्यकता है।', 'निर्माण तथा गैर-पंजीकृत विनिर्माण में कार्य करने की स्थितियों में सुधार लाना चाहिए।', 'सेवा सेक्टर बेरोज़गारी की समस्या को कम करता रहा है।', 'बड़े पैमाने पर रोज़गार उपलब्ध करवाने के लिए सामाजिक क्षेत्र में खर्च का बढ़ना आवश्यक है।', 'D', 'Correct Answer: Option D (Increased social sector spending is imperative for large-scale job creation).

1. Why Option D is correct: The passage highlights that India needs around 24 million jobs over the next decade and that e-commerce can fill at best half of this requirement. It concludes that only sectors driving domestic demand, specifically health and education (social sector), can fill the remaining half.
2. Why Option A is incorrect: The passage merely states that labour is moving away from agriculture; it does not advocate taking strong measures to curb rural-to-urban migration.
3. Why Option B is incorrect: Although the passage notes that construction and unregistered manufacturing are not markedly better jobs, its central focus is on macro-level job generation rather than improving labour conditions.
4. Why Option C is incorrect: The passage explicitly contradicts this option by stating that services are "not generating the additional jobs the country needs."

Therefore, increased social sector spending is imperative for large-scale job creation.', 'सही उत्तर: विकल्प D (बड़े पैमाने पर रोज़गार उपलब्ध करवाने के लिए सामाजिक क्षेत्र में खर्च का बढ़ना आवश्यक है)।

1. विकल्प D क्यों सही है: परिच्छेद में स्पष्ट किया गया है कि भारत को अगले दशक में लगभग 24 मिलियन नौकरियों की आवश्यकता होगी और ई-व्यापार इस अंतर को केवल आधा ही भर पाएगा। परिच्छेद के अनुसार केवल स्वास्थ्य और शिक्षा जैसे सामाजिक क्षेत्र ही शेष आधे भाग को सुगमतापूर्वक भर सकते हैं।
2. विकल्प A क्यों गलत है: परिच्छेद केवल कृषि से श्रमिकों के हटने की बात करता है, यह ग्रामीण-शहरी प्रवसन को रोकने के लिए कड़े कदम उठाने का सुझाव नहीं देता।
3. विकल्प B क्यों गलत है: परिच्छेद यह उल्लेख करता है कि निर्माण और गैर-पंजीकृत विनिर्माण बेहतर रोज़गार नहीं हैं, लेकिन इसका मुख्य जोर कार्य-दशाओं के सुधार पर नहीं बल्कि नए रोज़गार सृजन पर है।
4. विकल्प C क्यों गलत है: परिच्छेद स्पष्ट रूप से कहता है कि सेवा क्षेत्र देश की आवश्यकता के अनुरूप अतिरिक्त रोज़गार अवसर उत्पन्न नहीं कर रहा है, अतः यह विकल्प परिच्छेद के विपरीत है।

अतः सामाजिक क्षेत्र में खर्च का बढ़ना बड़े पैमाने पर रोज़गार सृजन के लिए सर्वाधिक महत्वपूर्ण निहितार्थ है।', NULL),
    ('csat-2020-q2', 2, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing & Privacy Rights in Digital Economy', 'पूर्वधारणा परीक्षण एवं डिजिटल अर्थव्यवस्था में निजता के अधिकार', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Right to Privacy', 'Digital Governance']::TEXT[], 'On the basis of the above passage, the following assumptions have been made:
1. State should have some institutions to ensure its appropriate role in a digital society.
2. State should ensure that private parties do not violate the citizens'' right to privacy.
3. Digital economy is not compatible with the idea of not violating the citizens'' privacy.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के आधार पर निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. डिजिटल समाज में राज्य के पास ऐसी संस्थाएँ होनी चाहिए जो इसकी समुचित भूमिका को सुनिश्चित कर सकें।
2. राज्य को सुनिश्चित करना चाहिए कि गैर-सरकारी पक्षकार नागरिकों की निजता के अधिकार का हनन न करें।
3. डिजिटल अर्थव्यवस्था नागरिकों की निजता का हनन न करने के विचार से सुसंगत नहीं है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 and 2', '3 only', '1 and 3', '2 only', '1 और 2', 'केवल 3', '1 और 3', 'केवल 2', 'A', 'Correct Answer: Option A (1 and 2).

1. Why Assumption 1 is valid: The passage argues that the State must actively ensure private entities do not thwart substantive rights in the digital age, which presupposes the existence of state institutional mechanisms to enforce this protection.
2. Why Assumption 2 is valid: The passage explicitly states that the State must actively ensure private parties are not able to block individual rights, which directly applies to the right to privacy in the digital age.
3. Why Assumption 3 is invalid: The passage discusses managing digital realities and safeguarding rights; it nowhere assumes that the digital economy is inherently incompatible with citizen privacy.

Therefore, assumptions 1 and 2 are valid.', 'सही उत्तर: विकल्प A (1 और 2)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद के अनुसार डिजिटल युग में अधिकारों की रक्षा के लिए राज्य को केवल तटस्थ न रहकर सक्रिय भूमिका निभानी होगी, जो यह पूर्वमान्यता रखती है कि राज्य के पास इस भूमिका को निभाने हेतु संस्थागत तंत्र होना चाहिए।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद सीधे तौर पर कहता है कि राज्य को सक्रिय रूप से सुनिश्चित करना चाहिए कि गैर-सरकारी पक्षकार अधिकारों को अवरुद्ध न कर सकें।
3. पूर्वधारणा 3 क्यों अवैध है: परिच्छेद डिजिटल युग की चुनौतियों और अधिकारों के संरक्षण की बात करता है, यह कहीं भी यह नहीं मानता कि डिजिटल अर्थव्यवस्था निजता के साथ पूरी तरह असंगत है।

अतः पूर्वधारणाएँ 1 और 2 वैध हैं।', NULL),
    ('csat-2020-q3', 3, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Ecological System Inference & Wetland Conservation', 'पारिस्थितिक तंत्र निष्कर्ष एवं आर्द्रभूमि संरक्षण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Wetlands Ecology', 'Water Resources']::TEXT[], 'Which one of the following is the most logical and rational inference that can be made from the above passage?', 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तर्कसंगत और विवेकपूर्ण निष्कर्ष निकाला जा सकता है?', 'Rivers and other wetlands should be protected under Ramsar Convention.', 'Engineering water systems should be modernized and further augmented.', 'Wetlands need to be reinforced as more than just open sources of water.', 'Water supply should not be free of cost so as to prevent its misuse or overuse.', 'रामसर समझौते के अंतर्गत नदियों एवं अन्य आर्द्रभूमियों को संरक्षित किया जाना चाहिए।', 'जल प्रणालियों के निर्माण का आधुनिकीकरण किया जाना चाहिए और आगे अभिवृद्धित किया जाना चाहिए।', 'आर्द्रभूमियों को जल के मुक्त स्रोत के रूप से कहीं अधिक प्रबलित करना चाहिए।', 'जल की आपूर्ति निःशुल्क नहीं होनी चाहिए ताकि इसके दुरुपयोग और अति-उपयोग को रोका जा सके।', 'C', 'Correct Answer: Option C (Wetlands need to be reinforced as more than just open sources of water).

1. Why Option C is correct: The passage criticizes public policy for treating water merely as an extractable commodity rather than part of an ecological system, emphasizing that policies should strengthen ecological systems instead of merely augmenting water supply.
2. Why Option A is incorrect: The Ramsar Convention is an external international framework not mentioned or discussed in the passage.
3. Why Option B is incorrect: The passage explicitly critiques the singular focus on engineering water systems to augment supply without strengthening ecological health.
4. Why Option D is incorrect: Water pricing and economic tariffs are not raised in the passage.

Therefore, option C is the most logical and rational inference.', 'सही उत्तर: विकल्प C (आर्द्रभूमियों को जल के मुक्त स्रोत के रूप से कहीं अधिक प्रबलित करना चाहिए)।

1. विकल्प C क्यों सही है: परिच्छेद इस बात की आलोचना करता है कि जल को पारिस्थितिक तंत्र से अलग केवल एक उपभोज्य वस्तु के रूप में देखा जाता है। यह स्पष्ट करता है कि जल प्रणाली के निर्माण से अधिक आवश्यक पारिस्थितिक प्रणाली की क्षमताओं को मजबूत बनाना है।
2. विकल्प A क्यों गलत है: परिच्छेद में रामसर समझौते का कोई उल्लेख नहीं है।
3. विकल्प B क्यों गलत है: परिच्छेद केवल जल आपूर्ति बढ़ाने वाली इंजीनियरिंग प्रणालियों पर अत्यधिक निर्भरता पर सवाल उठाता है।
4. विकल्प D क्यों गलत है: जल के शुल्क या मूल्य निर्धारण की परिच्छेद में कोई चर्चा नहीं की गई है।

अतः विकल्प C सर्वाधिक तर्कसंगत और विवेकपूर्ण निष्कर्ष है।', NULL),
    ('csat-2020-q4', 4, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Author''s Tone & Asset Allocation Strategy', 'लेखक की सलाह एवं संपत्ति आवंटन रणनीति', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Financial Risk', 'Asset Allocation']::TEXT[], 'Which one of the following statements best implies the suggestion given by the author of the passage?', 'निम्न कथनों में से कौन-सा एक परिच्छेद के लेखक द्वारा दी गई सलाह को श्रेष्ठ रूप से निहित करता है?', 'Distribute your wealth across different kinds of assets so that your risks would be minimized.', 'Risk-taking behaviour should be a necessary component of your personality if you want to generate wealth.', 'While making investments, find a trustworthy asset management organization which would manage your wealth for you.', 'You should know that investing your money is a risky business.', 'अपने धन को विभिन्न प्रकार की संपत्तियों में इस प्रकार बाँटें कि आपका जोखिम न्यूनीकृत हो सके।', 'यदि आप धन कमाना चाहते हैं, तो जोखिम उठाने वाला व्यवहार आपके व्यक्तित्व का एक आवश्यक घटक होना चाहिए।', 'निवेश करते समय, एक ऐसे भरोसेमंद संपत्ति-प्रबंधन संगठन/संस्था को खोजिए जो आपके लिए आपके धन का ठीक प्रबंधन कर सके।', 'आपको जानना चाहिए कि आपके धन का निवेश एक जोखिम भरा व्यवसाय है।', 'A', 'Correct Answer: Option A (Distribute your wealth across different kinds of assets so that your risks would be minimized).

1. Why Option A is correct: The author opens by calling asset allocation the most crucial investment decision and explains that leaving money idle out of fear of risk is flawed because extreme risks across different assets do not all manifest simultaneously.
2. Why Option B is incorrect: The author does not advise becoming a reckless risk-taker as a personality trait, but rather managing risk prudently through diversification.
3. Why Option C is incorrect: Hiring third-party asset management organizations is not mentioned in the text.
4. Why Option D is incorrect: This is merely a descriptive statement about risk, not the constructive strategic advice implied by the author.

Therefore, distributing wealth across different asset classes to minimize risk best captures the author''s suggestion.', 'सही उत्तर: विकल्प A (अपने धन को विभिन्न प्रकार की संपत्तियों में इस प्रकार बाँटें कि आपका जोखिम न्यूनीकृत हो सके)।

1. विकल्प A क्यों सही है: लेखक संपत्ति के विनिधान (Asset allocation) को सबसे महत्वपूर्ण निर्णय बताता है और समझाता है कि धन को निष्क्रिय रखने के बजाय विभिन्न संपत्तियों में बाँटना चाहिए क्योंकि सभी संपत्तियों में जोखिम एक साथ घटित नहीं होते।
2. विकल्प B क्यों गलत है: लेखक अंधाधुंध जोखिम लेने को व्यक्तित्व का हिस्सा बनाने की सलाह नहीं देता, बल्कि विवेकपूर्ण विविधीकरण की बात करता है।
3. विकल्प C क्यों गलत है: किसी संपत्ति-प्रबंधन संस्था को नियुक्त करने की बात परिच्छेद में नहीं की गई है।
4. विकल्प D क्यों गलत है: यह केवल जोखिम का एक सामान्य विवरण है, लेखक द्वारा दी गई व्यावहारिक सलाह नहीं।

अतः विकल्प A लेखक की सलाह को सर्वश्रेष्ठ रूप से व्यक्त करता है।', NULL),
    ('csat-2020-q5', 5, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing in Agricultural Biotechnology Regulation', 'कृषि जैव प्रौद्योगिकी नियमन में पूर्वधारणा परीक्षण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Biotechnology Regulation', 'GM Crops']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Biotechnology regulation is an evolving process.
2. Participation of people is needed in policy decisions regarding biotechnology regulation.
3. Biotechnology regulation should take into account socio-economic aspects in decision-making.
4. Wider involvement of political executive in biotechnology regulation improves its effectiveness in dealing with the country''s trade policies and international obligations.
Which of the above assumptions are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जैव प्रौद्योगिकी नियमन एक विकासशील प्रक्रिया है।
2. जैव प्रौद्योगिकी नियमन के विषय में नीति निर्णय के लिए लोगों की भागीदारी की आवश्यकता है।
3. जैव प्रौद्योगिकी नियमन के निर्णयन में सामाजिक-आर्थिक पहलुओं को भी ध्यान में रखना चाहिए।
4. जैव प्रौद्योगिकी नियमन में राजनैतिक कार्यपालिका का व्यापक रूप में शामिल होना देश की व्यापार नीतियों और अंतर्राष्ट्रीय दायित्वों को निपटाने की प्रभाविता में सुधार लाता है।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?', '1, 2 and 4 only', '1 and 3 only', '2, 3 and 4 only', '1, 2, 3 and 4', 'केवल 1, 2 और 4', 'केवल 1 और 3', 'केवल 2, 3 और 4', '1, 2, 3 और 4', 'B', 'Correct Answer: Option B (1 and 3 only).

1. Why Assumption 1 is valid: The passage notes that crops will move from single-trait to multi-trait engineering and that regulation cannot be understood solely in the context of the current generation, assuming that regulation must evolve over time.
2. Why Assumption 3 is valid: The text directly states the need to take a comprehensive look "taking into account various aspects, including socio-economic impacts."
3. Why Assumption 2 is invalid: Public participation in policy decisions is not mentioned or presupposed in the passage.
4. Why Assumption 4 is invalid: The passage discusses aligning domestic regulation with trade policy and international treaties, but nowhere assumes that the political executive must be broadly involved.

Therefore, only assumptions 1 and 3 are valid.', 'सही उत्तर: विकल्प B (केवल 1 और 3)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद के अनुसार भविष्य में बहु-लक्षण फसलों के आने से नियमन को केवल वर्तमान पीढ़ी के संदर्भ में नहीं समझा जा सकता, जिससे सिद्ध होता है कि जैव प्रौद्योगिकी नियमन एक निरंतर विकसित होने वाली प्रक्रिया है।
2. पूर्वधारणा 3 क्यों वैध है: परिच्छेद स्पष्ट रूप से नियमन के दौरान ''सामाजिक-आर्थिक प्रभावों'' को ध्यान में रखने की आवश्यकता पर बल देता है।
3. पूर्वधारणा 2 क्यों अवैध है: नीतिगत निर्णयों में जन-भागीदारी की आवश्यकता का परिच्छेद में कोई उल्लेख या संकेत नहीं है।
4. पूर्वधारणा 4 क्यों अवैध है: परिच्छेद व्यापार नीतियों और अंतरराष्ट्रीय संधियों से समन्वय की बात करता है, किन्तु इसमें ''राजनैतिक कार्यपालिका के व्यापक समावेश'' की कोई पूर्वधारणा नहीं है।

अतः केवल 1 और 3 वैध पूर्वधारणाएँ हैं।', NULL),
    ('csat-2020-q6', 6, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Crux Identification (Scope of Agricultural Biotechnology)', 'परिच्छेद का मर्म (कृषि जैव प्रौद्योगिकी का दायरा)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Crux Analysis', 'Biotechnology']::TEXT[], 'Which one of the following statements best implies the crux of the passage?', 'निम्नलिखित में से कौन-सा कथन परिच्छेद के मर्म को श्रेष्ठ रूप से अंतर्निहित करता है?', 'Precautionary principle is not given importance in current debate on developing GM crops.', 'Biotechnology is not currently used in climate change mitigation and adaptation mechanisms.', 'Biotechnology''s role is not confined to the current priorities of developing GM crops.', 'The negative impacts of biotechnology are not properly understood.', 'जी० एम० फसलों के विकास पर वर्तमान विमर्श में सतर्कता सिद्धांत को महत्त्व नहीं दिया गया है।', 'वर्तमान में जलवायु परिवर्तन प्रशमन और अनुकूलन क्रियाविधियों में जैव प्रौद्योगिकी का उपयोग नहीं किया जाता है।', 'जैव प्रौद्योगिकी की भूमिका जी० एम० फसलों के विकास के लिए आज की प्राथमिकता तक सीमित नहीं है।', 'जैव प्रौद्योगिकी के नकारात्मक परिणाम ठीक ढंग से नहीं समझे गए हैं।', 'C', 'Correct Answer: Option C (Biotechnology''s role is not confined to the current priorities of developing GM crops).

1. Why Option C is correct: The central thrust of the passage is that agricultural biotechnology must be evaluated broadly—encompassing future multi-trait crops, climate change adaptation, socio-economic factors, and global trade commitments—rather than being narrowly confined to existing single-trait GM crops.
2. Why Option A is incorrect: The "precautionary principle" is not mentioned or discussed as the central topic.
3. Why Option B is incorrect: The passage states that biotechnology is crucial for climate change mitigation and adaptation, not that it is entirely unused.
4. Why Option D is incorrect: While the passage mentions minimizing negative impacts, understanding negative impacts is not the primary thesis or crux of the passage.

Therefore, option C best captures the crux of the passage.', 'सही उत्तर: विकल्प C (जैव प्रौद्योगिकी की भूमिका जी० एम० फसलों के विकास के लिए आज की प्राथमिकता तक सीमित नहीं है)।

1. विकल्प C क्यों सही है: परिच्छेद का मुख्य संदेश यही है कि जैव प्रौद्योगिकी की भूमिका को केवल वर्तमान एकल-लक्षण जी० एम० फसलों तक सीमित नहीं माना जा सकता; इसका दायरा भविष्य की बहु-लक्षण फसलों, जलवायु परिवर्तन अनुकूलन और व्यापक सामाजिक-आर्थिक संदर्भों तक फैला हुआ है।
2. विकल्प A क्यों गलत है: परिच्छेद में ''सतर्कता सिद्धांत'' (Precautionary principle) का कोई प्रत्यक्ष विमर्श नहीं है।
3. विकल्प B क्यों गलत है: परिच्छेद जलवायु परिवर्तन में जैव प्रौद्योगिकी के अनिवार्य उपयोग पर बल देता है, यह यह नहीं कहता कि इसका वर्तमान में उपयोग नहीं हो रहा है।
4. विकल्प D क्यों गलत है: नकारात्मक प्रभावों को कम करने की बात कही गई है, लेकिन यह परिच्छेद का केंद्रीय मर्म नहीं है।

अतः विकल्प C परिच्छेद के मर्म को सर्वश्रेष्ठ रूप से दर्शाता है।', NULL),
    ('csat-2020-q7', 7, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Trailing Zeroes in Products & Factorization (Powers of 2 and 5)', 'गुणनफल में अंतिम शून्य एवं गुणनखंडन (2 और 5 की घातें)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Trailing Zeroes', 'Factorization']::TEXT[], 'How many zeroes are there at the end of the following product?
$$1 \times 5 \times 10 \times 15 \times 20 \times 25 \times 30 \times 35 \times 40 \times 45 \times 50 \times 55 \times 60$$', 'गुणनफल
$$1 \times 5 \times 10 \times 15 \times 20 \times 25 \times 30 \times 35 \times 40 \times 45 \times 50 \times 55 \times 60$$
के अंत में कितने शून्य होंगे?', '10', '12', '14', '15', '10', '12', '14', '15', 'A', 'Correct Answer: Option A (10).

1. The number of trailing zeroes in a product is determined by the number of pairs of factors $2 \times 5$, which is $\min(\text{count of 2s}, \text{count of 5s})$.
2. Count the factors of 2 in each term of the product:
   * $10 = 2^1 \times 5$
   * $20 = 2^2 \times 5$
   * $30 = 2^1 \times 3 \times 5$
   * $40 = 2^3 \times 5$
   * $50 = 2^1 \times 5^2$
   * $60 = 2^2 \times 3 \times 5$
   Total count of 2s = $1 + 2 + 1 + 3 + 1 + 2 = 10$.
3. Count the factors of 5 in the product:
   * $5 (1), 10 (1), 15 (1), 20 (1), 25 (2), 30 (1), 35 (1), 40 (1), 45 (1), 50 (2), 55 (1), 60 (1)$
   Total count of 5s = $14$.

Therefore, the number of trailing zeroes is $\min(10, 14) = 10$.', 'सही उत्तर: विकल्प A (10)।

1. किसी गुणनफल के अंत में शून्यों की संख्या उसमें उपस्थित $2 \times 5$ के युग्मों की संख्या, अर्थात् $\min(2 \text{ की घात}, 5 \text{ की घात})$ पर निर्भर करती है।
2. गुणनफल के पदों में 2 के गुणनखंडों की कुल संख्या:
   * $10 = 2^1$
   * $20 = 2^2$
   * $30 = 2^1$
   * $40 = 2^3$
   * $50 = 2^1$
   * $60 = 2^2$
   2 की कुल घात $= 1 + 2 + 1 + 3 + 1 + 2 = 10$.
3. 5 के गुणनखंडों की कुल संख्या $= 14$ है।

अतः अंत में शून्यों की संख्या $\min(10, 14) = 10$ होगी।', NULL),
    ('csat-2020-q8', 8, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', '3-Digit Permutative Place Value & Divisibility Properties', 'तीन-अंकीय स्थानीय मान योग एवं विभाज्यता गुणधर्म', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Place Value', 'Divisibility Rules']::TEXT[], 'Let XYZ be a three-digit number, where $(X+Y+Z)$ is not a multiple of 3. Then $(XYZ+YZX+ZXY)$ is not divisible by', 'माना कि XYZ तीन अंकों की एक संख्या है, जहाँ $(X+Y+Z)$, 3 का गुणांक नहीं है। तब $(XYZ+YZX+ZXY)$ विभाज्य नहीं है', '3', '9', '37', '(X+Y+Z)', '3 से', '9 से', '37 से', '(X+Y+Z) से', 'B', 'Correct Answer: Option B (9).

1. Express the 3-digit numbers in expanded decimal notation:
   $$XYZ = 100X + 10Y + Z$$
   $$YZX = 100Y + 10Z + X$$
   $$ZXY = 100Z + 10X + Y$$
2. Summing all three numbers:
   $$XYZ + YZX + ZXY = 111(X + Y + Z) = 3 \times 37 \times (X + Y + Z)$$
3. The sum has prime factors 3, 37, and $(X + Y + Z)$. Since it is given that $(X + Y + Z)$ is not a multiple of 3, there is only a single factor of 3 in the prime factorization, making divisibility by $9 = 3^2$ impossible.

Therefore, $(XYZ+YZX+ZXY)$ is not divisible by 9.', 'सही उत्तर: विकल्प B (9 से)।

1. तीन अंकों की संख्याओं को स्थानीय मान के रूप में प्रसारित करने पर:
   $$XYZ = 100X + 10Y + Z$$
   $$YZX = 100Y + 10Z + X$$
   $$ZXY = 100Z + 10X + Y$$
2. तीनों का योग करने पर:
   $$XYZ + YZX + ZXY = 111(X + Y + Z) = 3 \times 37 \times (X + Y + Z)$$
3. यह योग 3, 37 और $(X+Y+Z)$ से पूर्णतः विभाज्य है। चूँकि $(X+Y+Z)$ 3 का गुणज नहीं है, अतः इस गुणनफल में 3 केवल एक बार आता है, इसलिए यह 9 ($3^2$) से विभाज्य नहीं हो सकता।

अतः $(XYZ+YZX+ZXY)$, 9 से विभाज्य नहीं है।', NULL),
    ('csat-2020-q9', 9, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Linear Equations & Inequality Comparison of Natural Numbers', 'रैखिक समीकरण एवं प्राकृतिक संख्याओं की तुलना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Algebraic Equalities', 'Natural Numbers']::TEXT[], 'Let p, q, r and s be natural numbers such that
$$p-2016=q+2017=r-2018=s+2019$$
Which one of the following is the largest natural number?', 'माना कि p, q, r और s इस प्रकार की प्राकृतिक संख्याएँ हैं कि
$$p-2016=q+2017=r-2018=s+2019$$
है। निम्न में से कौन-सी सबसे बड़ी प्राकृतिक संख्या है?', 'p', 'q', 'r', 's', 'p', 'q', 'r', 's', 'C', 'Correct Answer: Option C (r).

1. Let $p - 2016 = q + 2017 = r - 2018 = s + 2019 = k$, where $k$ is a constant.
2. Express each variable in terms of $k$:
   * $p = k + 2016$
   * $q = k - 2017$
   * $r = k + 2018$
   * $s = k - 2019$
3. Comparing these values, $r = k + 2018$ is the greatest among all four numbers ($k+2018 > k+2016 > k-2017 > k-2019$).

Therefore, r is the largest natural number.', 'सही उत्तर: विकल्प C (r)।

1. माना कि $p - 2016 = q + 2017 = r - 2018 = s + 2019 = k$ है।
2. प्रत्येक चर का मान $k$ के पदों में व्यक्त करने पर:
   * $p = k + 2016$
   * $q = k - 2017$
   * $r = k + 2018$
   * $s = k - 2019$
3. इन मानों की तुलना करने पर स्पष्ट है कि $r = k + 2018$ सबसे बड़ा मान है।

अतः सबसे बड़ी प्राकृतिक संख्या r है।', NULL),
    ('csat-2020-q10', 10, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Sum Rule for Divisibility by 3 & Prime Number Testing', '3 से विभाज्यता का अंक-योग नियम एवं अभाज्य संख्या परीक्षण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Prime Numbers', 'Divisibility by 3']::TEXT[], 'How many five-digit prime numbers can be obtained by using all the digits 1, 2, 3, 4 and 5 without repetition of digits?', 'पाँच अंकों की कितनी अभाज्य संख्याएँ अंकों 1, 2, 3, 4 और 5 के द्वारा, बिना अंकों की पुनरावृत्ति किए हुए, बनाई जा सकती हैं?', 'Zero', 'One', 'Nine', 'Ten', 'शून्य', 'एक', 'नौ', 'दस', 'A', 'Correct Answer: Option A (Zero).

1. Any 5-digit number formed using all the digits 1, 2, 3, 4, and 5 without repetition has a sum of digits equal to:
   $$1 + 2 + 3 + 4 + 5 = 15$$
2. By the divisibility rule of 3, if the sum of the digits of a number is divisible by 3, the number itself must be divisible by 3.
3. Since 15 is divisible by 3, every such 5-digit number is divisible by 3 and strictly greater than 3, meaning every possible number is composite.

Therefore, the number of prime numbers that can be obtained is Zero.', 'सही उत्तर: विकल्प A (शून्य)।

1. अंकों 1, 2, 3, 4 और 5 के प्रयोग से बिना पुनरावृत्ति के बनने वाली किसी भी पाँच अंकों की संख्या के अंकों का योग:
   $$1 + 2 + 3 + 4 + 5 = 15$$
2. 3 की विभाज्यता के नियम के अनुसार, यदि अंकों का योग 3 से विभाज्य है, तो वह संख्या भी 3 से पूर्णतः विभाज्य होगी।
3. चूँकि 15, 3 से विभाज्य है, अतः इन अंकों से बनने वाली प्रत्येक संख्या 3 से विभाज्य (भाज्य संख्या) होगी और कोई भी संख्या अभाज्य नहीं हो सकती।

अतः प्राप्त होने वाली अभाज्य संख्याओं की संख्या शून्य है।', NULL),
    ('csat-2020-q11', 11, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Cryptarithmetic & Single Symbol Digit Substitution', 'अंक पहेली एवं प्रतीक अंक प्रतिस्थापन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Cryptarithmetic', 'Place Value Puzzles']::TEXT[], 'In the sum
$$\otimes+1\otimes+5\otimes+\otimes\otimes+\otimes1=1\otimes\otimes$$
for which digit does the symbol stand?', 'योग
$$\otimes+1\otimes+5\otimes+\otimes+\otimes1=1\otimes\otimes$$
में प्रतीक किस अंक को दर्शाता है?', '2', '3', '4', '5', '2', '3', '4', '5', 'B', 'Correct Answer: Option B (3).

1. Let the symbol represent the single digit $x$.
2. Expand each term into place-value format:
   * $\otimes = x$
   * $1\otimes = 10 + x$
   * $5\otimes = 50 + x$
   * $\otimes\otimes = 10x + x = 11x$
   * $\otimes1 = 10x + 1$
   * $1\otimes\otimes = 100 + 10x + x = 100 + 11x$
3. Set up the equation:
   $$x + (10 + x) + (50 + x) + 11x + (10x + 1) = 100 + 11x$$
   $$24x + 61 = 100 + 11x$$
   $$13x = 39 \implies x = 3$$

Therefore, the symbol stands for the digit 3.', 'सही उत्तर: विकल्प B (3)।

1. माना कि प्रतीक अंक $x$ को दर्शाता है।
2. सभी पदों का स्थानीय मान के अनुसार प्रसार करने पर:
   * $\otimes = x$
   * $1\otimes = 10 + x$
   * $5\otimes = 50 + x$
   * $\otimes\otimes = 11x$
   * $\otimes1 = 10x + 1$
   * $1\otimes\otimes = 100 + 11x$
3. समीकरण को हल करने पर:
   $$x + (10 + x) + (50 + x) + 11x + (10x + 1) = 100 + 11x$$
   $$24x + 61 = 100 + 11x$$
   $$13x = 39 \implies x = 3$$

अतः प्रतीक 3 को दर्शाता है।', NULL),
    ('csat-2020-q12', 12, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'HCF and GCD of Decimals / Fractions in Length Measurement', 'दशमलव/भिन्न का महत्तम समापवर्तक (HCF) एवं लंबाई मापन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'HCF', 'Decimals & Fractions']::TEXT[], 'If you have two straight sticks of length 7.5 feet and 3.25 feet, what is the minimum length can you measure?', 'यदि आपके पास दो सीधी 7-5 फुट और 3-25 फुट की छड़े हैं, तो आप कम-से-कम कितनी लम्बाई नाप सकते हैं?', '0.05 foot', '0.25 foot', '1 foot', '3.25 feet', '0.05 फुट', '0-25 फुट', '1 फुट', '3-25 फुट', 'B', 'Correct Answer: Option B (0.25 foot).

1. The minimum length that can be measured by repeated combination (addition and subtraction) of two straight lengths is their Highest Common Factor (HCF / GCD).
2. Convert both measurements into fractions:
   $$7.5 = \frac{15}{2} = \frac{30}{4} \text{ feet}, \quad 3.25 = \frac{13}{4} \text{ feet}$$
3. Find the HCF of the fractions:
   $$\text{HCF}\left(\frac{30}{4}, \frac{13}{4}\right) = \frac{\text{HCF}(30, 13)}{\text{LCM}(4, 4)} = \frac{1}{4} = 0.25 \text{ foot}$$
   (For instance, taking 7 lengths of 3.25 feet and subtracting 3 lengths of 7.5 feet: $7 \times 3.25 - 3 \times 7.5 = 22.75 - 22.50 = 0.25 \text{ foot}$).

Therefore, the minimum length you can measure is 0.25 foot.', 'सही उत्तर: विकल्प B (0.25 फुट)।

1. दो छड़ों के संयोजन (जोड़ने और घटाने) से नापी जा सकने वाली न्यूनतम लम्बाई उनकी लम्बाइयों के महत्तम समापवर्तक (HCF) के बराबर होती है।
2. लम्बाइयों को भिन्न में बदलने पर:
   $$7.5 = \frac{30}{4} \text{ फुट}, \quad 3.25 = \frac{13}{4} \text{ फुट}$$
3. भिन्नों का HCF निकालने पर:
   $$\text{HCF}\left(\frac{30}{4}, \frac{13}{4}\right) = \frac{\text{HCF}(30, 13)}{\text{LCM}(4, 4)} = \frac{1}{4} = 0.25 \text{ फुट}$$
   (उदाहरणार्थ: $7 \times 3.25 - 3 \times 7.5 = 22.75 - 22.50 = 0.25 \text{ फुट}$)।

अतः कम-से-कम 0.25 फुट की लम्बाई नापी जा सकती है।', NULL),
    ('csat-2020-q13', 13, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Prime Number Generation via Sequence Operations', 'अनुक्रम संक्रियाओं द्वारा अभाज्य संख्या निर्माण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Number Series', 'Prime Numbers']::TEXT[], 'A simple mathematical operation in each number of the sequence 14, 18, 20, 24, 30, 32, ... results in a sequence with respect to prime numbers. Which one of the following is the next number in the sequence?', 'अनुक्रम 14, 18, 20, 24, 30, 32, ... की प्रत्येक संख्या में एक सरल गणितीय संक्रिया द्वारा अभाज्य संख्याओं का एक अनुक्रम प्राप्त किया जाता है। निम्न में से कौन-सी अनुक्रम की अगली संख्या है?', '34', '36', '38', '40', '34', '36', '38', '40', 'C', 'Correct Answer: Option C (38).

1. Subtract 1 from each term in the given sequence:
   * $14 - 1 = 13$
   * $18 - 1 = 17$
   * $20 - 1 = 19$
   * $24 - 1 = 23$
   * $30 - 1 = 29$
   * $32 - 1 = 31$
2. The resulting numbers $(13, 17, 19, 23, 29, 31)$ form a sequence of consecutive prime numbers.
3. The next consecutive prime number after 31 is 37. Therefore, the next number in the sequence is $37 + 1 = 38$.

Therefore, the next number in the sequence is 38.', 'सही उत्तर: विकल्प C (38)।

1. दी गई श्रेणी के प्रत्येक पद में से 1 घटाने पर:
   * $14 - 1 = 13$
   * $18 - 1 = 17$
   * $20 - 1 = 19$
   * $24 - 1 = 23$
   * $30 - 1 = 29$
   * $32 - 1 = 31$
2. प्राप्त संख्याएँ $(13, 17, 19, 23, 29, 31)$ क्रमागत अभाज्य संख्याओं की शृंखला बनाती हैं।
3. 31 के बाद अगली अभाज्य संख्या 37 होती है, अतः अनुक्रम का अगला पद $37 + 1 = 38$ होगा।

अतः अनुक्रम की अगली संख्या 38 है।', NULL),
    ('csat-2020-q14', 14, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Sum of First n Natural Numbers & Torn Page Page-Pair Problem', 'प्रथम n प्राकृतिक संख्याओं का योग एवं फटे पन्नों की संख्या ज्ञात करना', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Arithmetic Progression', 'Sum of Integers']::TEXT[], 'One page is torn from a booklet whose pages are numbered in the usual manner starting from the first page as 1. The sum of the numbers on the remaining pages is 195. The torn page contains which of the following numbers?', 'एक पुस्तिका, जिसके पन्ने सामान्य रूप से हैं, पहले पन्ने की संख्या 1 से प्रारम्भ करते हुए अंकित हैं। इस पुस्तिका से एक पन्ना फाड़ लिया जाता है। बचे हुए पन्नों पर अंकित पृष्ठ संख्याओं का योग 195 है। फटे हुए पन्ने पर निम्न में से कौन-सी संख्याएँ हैं?', '5, 6', '7, 8', '9, 10', '11, 12', '5, 6', '7, 8', '9, 10', '11, 12', 'B', 'Correct Answer: Option B (7, 8).

1. Let the booklet have $n$ total pages. The sum of page numbers from 1 to $n$ is $S = \frac{n(n+1)}{2}$.
2. Tearing one leaf removes two consecutive page numbers: an odd page $x$ on the front and an even page $x+1$ on the back. The remaining sum is $S - (2x + 1) = 195$.
3. For $n = 20$, the total sum $S = \frac{20 \times 21}{2} = 210$.
4. The sum of the two torn page numbers is $210 - 195 = 15$. Setting $x + (x + 1) = 15 \implies 2x = 14 \implies x = 7$.

Therefore, the torn page contains the numbers 7 and 8.', 'सही उत्तर: विकल्प B (7, 8)।

1. माना कि पुस्तिका में कुल $n$ पृष्ठ हैं। 1 से $n$ तक के पृष्ठों का योग $S = \frac{n(n+1)}{2}$ होता है।
2. एक पन्ना फाड़ने पर दो क्रमागत पृष्ठ संख्याएँ $x$ (विषम) और $x+1$ (सम) हट जाती हैं। अतः $S - (2x + 1) = 195$।
3. $n = 20$ लेने पर कुल योग $S = \frac{20 \times 21}{2} = 210$ आता है।
4. फटे हुए पन्ने के दोनों पृष्ठों का योग $= 210 - 195 = 15$। अतः $x + (x + 1) = 15 \implies 2x = 14 \implies x = 7$ और $x+1 = 8$।

अतः फटे हुए पन्ने पर अंकित संख्याएँ 7 और 8 हैं।', NULL),
    ('csat-2020-q15', 15, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Letter Sequence Pattern Completion & Repeating Blocks', 'वर्ण अनुक्रम पैटर्न पूर्णता एवं पुनरावर्ती खंड', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Letter Series', 'Pattern Completion']::TEXT[], 'Consider the following arrangement that has some missing letters:
$$abab\_b\_bcb\_dcdcded\_d$$
The missing letters which complete the arrangement are', 'निम्न विन्यास पर ध्यान दीजिए, जिसमें कुछ लुप्त वर्ण हैं :
$$abab\_b\_bcb\_dcdcded\_d$$
लुप्त वर्ण, जो कि विन्यास को पूर्ण करते हैं, हैं', 'a, b, c, d', 'a, b, d, e', 'a, c, c, e', 'b, c, d, e', 'a, b, c, d', 'a, b, d, e', 'a, c, c, e', 'b, c, d, e', 'C', 'Correct Answer: Option C (a, c, c, e).

1. Divide the arrangement into 4 blocks of 5 letters each following an alternating pattern:
   * Block 1: `ababa`
   * Block 2: `bcbcb`
   * Block 3: `cdcdc`
   * Block 4: `deded`
2. Combining these gives the full sequence: `ababa bcbcb cdcdc deded`.
3. Aligning with the template `abab[_] b[_]bcb [_]dcdc ded[_]d` reveals the missing letters in order are **a, c, c, e**.

Therefore, the missing letters are a, c, c, e.', 'सही उत्तर: विकल्प C (a, c, c, e)।

1. विन्यास को 5-5 अक्षरों के 4 खंडों में विभाजित करने पर एक व्यवस्थित एकांतर प्रतिरूप बनता है:
   * प्रथम खंड: `ababa`
   * द्वितीय खंड: `bcbcb`
   * तृतीय खंड: `cdcdc`
   * चतुर्थ खंड: `deded`
2. इस प्रकार पूर्ण शृंखला `ababa bcbcb cdcdc deded` बनती है।
3. दिए गए रिक्त स्थानों `abab[a] b[c]bcb [c]dcdc ded[e]d` की तुलना करने पर लुप्त वर्ण क्रमशः **a, c, c, e** प्राप्त होते हैं।

अतः लुप्त वर्ण a, c, c, e हैं।', NULL),
    ('csat-2020-q16', 16, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Cryptarithmetic Subtraction & Distinct Digits Place Value', 'अंकगणितीय व्यवकलन (घटाव) पहेली एवं स्थानीय मान', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Cryptarithmetic', 'Place Value']::TEXT[], 'Let A3BC and DE2F be four-digit numbers where each letter represents a different digit greater than 3. If the sum of the numbers is 15902, then what is the difference between the values of A and D?', 'माना कि A3BC और DE2F चार अंकों की संख्याएँ हैं, जहाँ प्रत्येक वर्ण 3 से बड़े भिन्न अंक को दर्शाता है। यदि संख्याओं का योग 15902 है, तो A और D के मानों के बीच अंतर क्या है?', '1', '2', '3', '4', '1', '2', '3', '4', 'C', 'Correct Answer: Option C (3).

1. The available distinct digits $> 3$ are $\{4, 5, 6, 7, 8, 9\}$.
2. Analyzing the column addition $A3BC + DE2F = 15902$:
   * **Units column**: $C + F = 12$ (with carry 1) $\implies \{C, F\} = \{4, 8\}$.
   * **Tens column**: $B + 2 + 1 = 10 \implies B = 7$ (with carry 1).
   * **Hundreds column**: $3 + E + 1 = 9 \implies E = 5$ (carry 0).
   * **Thousands column**: $A + D = 15$.
3. The remaining available digits from the set are $6$ and $9$. Thus, $\{A, D\} = \{6, 9\}$.
4. The difference between $A$ and $D$ is $|9 - 6| = 3$.

Therefore, the difference between the values of A and D is 3.', 'सही उत्तर: विकल्प C (3)।

1. 3 से बड़े अनुमत भिन्न अंक $\{4, 5, 6, 7, 8, 9\}$ हैं।
2. जोड़ $A3BC + DE2F = 15902$ के स्तंभों का विश्लेषण करने पर:
   * **इकाई स्तंभ**: $C + F = 12$ (हासिल 1) $\implies \{C, F\} = \{4, 8\}$।
   * **दहाई स्तंभ**: $B + 2 + 1 = 10 \implies B = 7$ (हासिल 1)।
   * **सैकड़ा स्तंभ**: $3 + E + 1 = 9 \implies E = 5$ (हासिल 0)।
   * **हजार स्तंभ**: $A + D = 15$।
3. शेष बचे अंक $6$ और $9$ हैं, अतः $\{A, D\} = \{6, 9\}$।
4. $A$ और $D$ के मानों का अंतर $= |9 - 6| = 3$ है।

अतः A और D के मानों के बीच अंतर 3 है।', NULL),
    ('csat-2020-q17', 17, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Data Sufficiency in Geometry (Circles & Point Coordinates)', 'ज्यामिति में आंकड़े की पर्याप्तता (वृत्त एवं निर्देशांक बिंदु)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Sufficiency', 'Geometry', 'Coordinate Logic']::TEXT[], 'Two Statements S1 and S2 are given below followed by a Question:
S1: There are not more than two figures on any page of a 51-page book.
S2: There is at least one figure on every page.
Question:
Are there more than 100 figures in that book?
Which one of the following is correct in respect of the above Statements and the Question?', 'दो कथन S1 और S2 नीचे दिए गए हैं, जिनके उपरान्त एक प्रश्न है :
S1 : 51 पृष्ठों की एक पुस्तक में किसी भी पृष्ठ पर दो से अधिक रेखाचित्र नहीं हैं।
S2 : प्रत्येक पृष्ठ पर कम-से-कम एक रेखाचित्र है।
प्रश्न :
क्या इस पुस्तक में 100 से अधिक रेखाचित्र हैं?
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'Both S1 and S2 are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'दोनों कथन S1 और S2 प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'अकेला S1 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'C', 'Correct Answer: Option C (S1 and S2 together are not sufficient to answer the Question).

1. From Statement S1: Total figures $\le 51 \times 2 = 102$. The total number of figures can be anywhere from 0 to 102, so S1 alone is insufficient.
2. From Statement S2: Total figures $\ge 51 \times 1 = 51$. The total number of figures can be 51 or much larger, so S2 alone is insufficient.
3. Combining S1 and S2: The total number of figures is bounded in the range $[51, 102]$. The total could be 80 ($\le 100$) or 101 ($> 100$), so a definitive Yes/No answer cannot be determined.

Therefore, S1 and S2 together are not sufficient to answer the Question.', 'सही उत्तर: विकल्प C (S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं)।

1. कथन S1 से: कुल रेखाचित्र $\le 51 \times 2 = 102$ होंगे (0 से 102 तक), अतः S1 अकेला पर्याप्त नहीं है।
2. कथन S2 से: कुल रेखाचित्र $\ge 51 \times 1 = 51$ होंगे, अतः S2 अकेला भी पर्याप्त नहीं है।
3. दोनों कथनों को मिलाने पर: कुल रेखाचित्रों की संख्या 51 से 102 के बीच होगी। चूँकि यह संख्या 100 से कम (जैसे 80) भी हो सकती है और 100 से अधिक (जैसे 101) भी हो सकती है, अतः निश्चित उत्तर प्राप्त नहीं किया जा सकता।

अतः S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', NULL),
    ('csat-2020-q18', 18, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Weighted Averages & Class Proportion Determination', 'भारित औसत एवं कक्षा अनुपात निर्धारण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Weighted Averages', 'Mixtures & Allegations']::TEXT[], 'Consider the following data:
* Average marks in English: Girls = 9, Boys = 8, Overall average marks = 8.8
* Average marks in Hindi: Girls = 8, Boys = 7, Overall average marks = x
What is the value of x in the above table?', 'निम्नलिखित आँकड़ों पर विचार कीजिए:
* अंग्रेजी में माध्य प्राप्तांक: लड़कियाँ = 9, लड़के = 8, कुल माध्य प्राप्तांक = 8.8
* हिन्दी में माध्य प्राप्तांक: लड़कियाँ = 8, लड़के = 7, कुल माध्य प्राप्तांक = x
उपर्युक्त सारणी में x का मान क्या है?', '7.8', '7.6', '7.4', '7.2', '7.8', '7.6', '7.4', '7.2', 'A', 'Correct Answer: Option A (7.8).

1. Let the number of girls be $G$ and the number of boys be $B$. Using the weighted average for English marks:
   $$\frac{9G + 8B}{G + B} = 8.8 \implies 9G + 8B = 8.8G + 8.8B \implies 0.2G = 0.8B \implies \frac{G}{B} = \frac{4}{1}$$
2. The ratio of Girls to Boys is $4 : 1$.
3. Calculate the overall average in Hindi ($x$):
   $$x = \frac{8G + 7B}{G + B} = \frac{8(4) + 7(1)}{4 + 1} = \frac{32 + 7}{5} = \frac{39}{5} = 7.8$$

Therefore, the value of x is 7.8.', 'सही उत्तर: विकल्प A (7.8)।

1. माना लड़कियों की संख्या $G$ तथा लड़कों की संख्या $B$ है। अंग्रेजी के औसत से अनुपात निकालने पर:
   $$\frac{9G + 8B}{G + B} = 8.8 \implies 9G + 8B = 8.8G + 8.8B \implies 0.2G = 0.8B \implies \frac{G}{B} = \frac{4}{1}$$
2. लड़कियों और लड़कों की संख्या का अनुपात $4 : 1$ है।
3. हिन्दी में कुल माध्य प्राप्तांक ($x$) का मान ज्ञात करने पर:
   $$x = \frac{8G + 7B}{G + B} = \frac{8(4) + 7(1)}{4 + 1} = \frac{32 + 7}{5} = \frac{39}{5} = 7.8$$

अतः सारणी में x का मान 7.8 है।', NULL),
    ('csat-2020-q19', 19, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Blood Relations, Family Tree & Gender Logic', 'रक्त संबंध, पारिवारिक वृक्ष एवं लिंग निर्धारण तर्क', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Blood Relations', 'Family Tree']::TEXT[], 'A family of two generations consisting of six members P, Q, R, S, T and U has three males and three females. There are two married couples and two unmarried siblings. U is P''s daughter and Q is R''s mother-in-law. T is an unmarried male and S is a male. Which one of the following is correct?', 'एक परिवार की दो पीढ़ियों के छः सदस्यों P, Q, R, S, T और U में तीन पुरुष और तीन महिलाएँ हैं। उनमें दो विवाहित जोड़े और दो अविवाहित सहोदर हैं। U, P की पुत्री है और Q, R की सास है। T अविवाहित पुरुष है और S एक पुरुष है। निम्नलिखित में से कौन-सा सही है?', 'R is U''s husband.', 'R is S''s wife.', 'S is unmarried.', 'None of the above', 'R, U का पति है।', 'R, S की पत्नी है।', 'S अविवाहित है।', 'उपर्युक्त में से कोई नहीं', 'B', 'Correct Answer: Option B (R is S''s wife).

1. Members: 3 males and 3 females across 2 generations with 2 married couples and 2 unmarried siblings.
2. Generation 1 consists of parents $P$ (male) and $Q$ (female), as $Q$ is a mother-in-law.
3. Generation 2 includes children $S$ (male), $T$ (unmarried male), and $U$ (unmarried female daughter of $P$).
4. $T$ and $U$ are the two unmarried siblings. The second married couple must be $S$ (male) and $R$ (female), making $Q$ the mother-in-law of $R$.

Therefore, R is S''s wife.', 'सही उत्तर: विकल्प B (R, S की पत्नी है)।

1. परिवार में 3 पुरुष और 3 महिलाएँ तथा 2 पीढ़ियाँ हैं, जिनमें 2 विवाहित जोड़े और 2 अविवाहित सहोदर हैं।
2. पहली पीढ़ी में माता-पिता $P$ (पुरुष) और $Q$ (महिला) हैं, क्योंकि $Q$ सास है।
3. दूसरी पीढ़ी में संतानें $S$ (पुरुष), $T$ (अविवाहित पुरुष) और $U$ (अविवाहित पुत्री/महिला) हैं।
4. $T$ और $U$ दो अविवाहित सहोदर हैं, अतः दूसरा विवाहित जोड़ा $S$ और $R$ (महिला) है, जिससे $Q, R$ की सास बनती है।

अतः R, S की पत्नी है सही उत्तर है।', NULL),
    ('csat-2020-q20', 20, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Calendar Odd Days & Leap Year vs Ordinary Year Day-Matching', 'कैलेंडर विषम दिन एवं लीप वर्ष बनाम सामान्य वर्ष वार गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Clocks & Calendar', 'Odd Days']::TEXT[], 'If in a particular year 12th January is a Sunday, then which one of the following is correct?', 'यदि किसी विशेष वर्ष में 12 जनवरी को रविवार है, तो निम्नलिखित में से कौन-सा सही है?', '15th July is a Sunday if the year is a leap year.', '15th July is a Sunday if the year is not a leap year.', '12th July is a Sunday if the year is a leap year.', '12th July is not a Sunday if the year is a leap year.', '15 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', '15 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष नहीं है।', '12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', '12 जुलाई को रविवार नहीं है यदि वर्ष एक अधिवर्ष है।', 'C', 'Correct Answer: Option C (12th July is a Sunday if the year is a leap year).

1. In a leap year, February has 29 days. Calculate the total number of days between 12th January and 12th July:
   * January remaining = $31 - 12 = 19$ days
   * February = 29 days
   * March = 31 days
   * April = 30 days
   * May = 31 days
   * June = 30 days
   * July = 12 days
2. Total days = $19 + 29 + 31 + 30 + 31 + 30 + 12 = 182$ days.
3. Odd days = $182 \pmod 7 = 0$.
4. Since there are 0 odd days, 12th July falls on the exact same day of the week as 12th January (Sunday).

Therefore, 12th July is a Sunday if the year is a leap year.', 'सही उत्तर: विकल्प C (12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है)।

1. एक अधिवर्ष (Leap year) में फरवरी में 29 दिन होते हैं। 12 जनवरी से 12 जुलाई के बीच कुल दिन:
   * जनवरी (शेष) $= 31 - 12 = 19$ दिन
   * फरवरी $= 29$ दिन
   * मार्च $= 31$ दिन
   * अप्रैल $= 30$ दिन
   * मई $= 31$ दिन
   * जून $= 30$ दिन
   * जुलाई $= 12$ दिन
2. कुल दिन $= 19 + 29 + 31 + 30 + 31 + 30 + 12 = 182$ दिन।
3. विषम दिन $= 182 \div 7 = 26$ सप्ताह (शेषफल $= 0$ दिन)।
4. शून्य विषम दिन होने के कारण, अधिवर्ष में 12 जुलाई का दिन भी 12 जनवरी (रविवार) के समान ही होगा।

अतः 12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', NULL),
    ('csat-2020-q21', 21, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Implicit Assumptions in Renewable Energy Import Strategy', 'नवीकरणीय ऊर्जा आयात रणनीति में अंतर्निहित पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Renewable Energy', 'Critical Assumptions']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Relying on foreign investment in the long run is not an economically sound policy.
2. Policies must be undertaken to reduce volatility in foreign private investment.
3. Policies must be undertaken to strengthen domestic private investment.
4. Public investment should be given priority over private investment.
5. Substantial public investment in education and health should be undertaken.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. दीर्घकाल में विदेशी निवेश पर भरोसा करना आर्थिक रूप से एक सही नीति नहीं है।
2. ऐसी नीतियों को अपनाया जाना चाहिए जो विदेशी निजी निवेश में चपलता को कम कर सकें।
3. घरेलू निजी निवेश को सशक्त बनाने वाली नीतियाँ अपनायी जानी चाहिए।
4. निजी निवेश की अपेक्षा सार्वजनिक निवेश को अधिक प्राथमिकता देनी चाहिए।
5. शिक्षा एवं स्वास्थ्य क्षेत्र में पर्याप्त सार्वजनिक निवेश किया जाना चाहिए।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1, 2 and 4', '1, 3 and 5', '2, 4 and 5', '3 only', '1, 2 और 4', '1, 3 और 5', '2, 4 और 5', 'केवल 3', 'B', 'Correct Answer: Option B (1, 3 and 5).

1. Why Assumptions 1, 3, and 5 are valid: The passage argues that foreign investment is volatile, causes regional inequalities, and cannot be relied upon for stable employment, validating that relying on it in the long run is economically unsound (Assumption 1). Because foreign private investment is inherently flighty across global avenues, domestic investment mechanisms must be strengthened to secure stable growth (Assumption 3). Furthermore, the passage notes that technology diffusion fails because India''s physical and human capital is inadequate, directly assuming that substantial public investment in human capital (education and health) is required (Assumption 5).
2. Why Assumption 2 is invalid: The passage states that the volatility of FDI is a "necessary consequence of their search for the highest returns" across the globe, implying that domestic policy cannot eliminate the global mobility and inherent volatility of foreign private capital.
3. Why Assumption 4 is invalid: The passage does not make a sweeping normative assumption that public investment must universally be prioritized over all private investment; it critiques the over-reliance on volatile foreign private flows.

Therefore, assumptions 1, 3, and 5 are valid.', 'सही उत्तर: विकल्प B (1, 3 और 5)।

1. पूर्वधारणाएँ 1, 3 और 5 क्यों वैध हैं: परिच्छेद स्पष्ट करता है कि विदेशी निजी निवेश अत्यंत चपल है और उस पर रोज़गार सृजन का दायित्व नहीं छोड़ा जा सकता, अतः दीर्घकाल में केवल इस पर निर्भर रहना आर्थिक रूप से सही नीति नहीं है (पूर्वधारणा 1)। चूँकि विदेशी पूँजी वैश्विक विकल्पों की तलाश में अस्थिर रहती है, इसलिए घरेलू स्तर पर निवेश को सशक्त बनाना आवश्यक है (पूर्वधारणा 3)। साथ ही, परिच्छेद बताता है कि भारत में मानवीय पूँजी की अपर्याप्तता के कारण प्रौद्योगिकी विसरण नहीं हो पाता, जो यह पूर्वधारित करता है कि शिक्षा और स्वास्थ्य (मानव पूँजी) में पर्याप्त सार्वजनिक निवेश की आवश्यकता है (पूर्वधारणा 5)।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद के अनुसार विदेशी निवेश की चपलता वैश्विक स्तर पर अधिकतम प्रतिफल की खोज का ''आवश्यक परिणाम'' है, जिसे केवल घरेलू नीतियों द्वारा समाप्त नहीं किया जा सकता।
3. पूर्वधारणा 4 क्यों अवैध है: परिच्छेद निजी निवेश पर सार्वजनिक निवेश को सामान्य प्राथमिकता देने की बात नहीं करता, बल्कि विदेशी निजी पूँजी पर अत्यधिक निर्भरता की सीमाओं को रेखांकित करता है।

अतः 1, 3 और 5 वैध पूर्वधारणाएँ हैं।', NULL),
    ('csat-2020-q22', 22, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Practical Implications for Solar Energy Ecosystem in India', 'भारत में सौर ऊर्जा पारिस्थितिकी तंत्र के व्यावहारिक निहितार्थ', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Solar Energy', 'Policy Implications']::TEXT[], 'With reference to the above passage, which of the following could be the most rational and practical implications for India?
1. Inter-linking of rivers should be undertaken.
2. A network of dams and canals should be built across the country for proper distribution of water.
3. Farmers should be provided easy loans for digging borewells.
4. Usage of water for agriculture should be regulated by law.
5. Distribution of river water among regions should be regulated by the Union Government.
Select the correct answer using the code given below.', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा भारत की दृष्टि से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हो सकता है?
1. नदियों के अंतःसंबंधन को प्रारंभ किया जाना चाहिए।
2. जल के यथोचित वितरण के लिए पूरे देश में बाँधों एवं नहरों के नेटवर्क का निर्माण किया जाना चाहिए।
3. कृषकों को बोरवेल की खुदाई के लिए सुलभ ऋण दिया जाना चाहिए।
4. कृषि में जल के प्रयोग को कानूनी रूप से नियंत्रित किया जाना चाहिए।
5. केन्द्र सरकार द्वारा विभिन्न क्षेत्रों में नदियों के जल के वितरण को नियंत्रित किया जाना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1 and 2', '2, 4 and 5', '1, 3 and 4', '2, 3 and 5', '1 और 2', '2, 4 और 5', '1, 3 और 4', '2, 3 और 5', 'A', 'Correct Answer: Option A (1 and 2).

1. Why Statements 1 and 2 are correct: The passage highlights that monsoon flows are highly skewed across time and space, causing simultaneous droughts and floods while unutilized river water drains into the sea. It explicitly advocates holding water in reservoirs to release throughout the year. Therefore, creating storage infrastructure (dams, canals) and transferring water from surplus to deficit river basins (inter-linking of rivers) are direct, practical implications.
2. Why Statement 3 is incorrect: Encouraging borewells depletes groundwater tables and does not address the passage''s primary focus on capturing seasonal monsoon surface run-off.
3. Why Statements 4 and 5 are incorrect: Legal rationing of agricultural water (4) and centralizing river water distribution (5) are regulatory/governance assertions that do not directly resolve the physical problem of unharvested monsoon run-off described in the text.

Therefore, 1 and 2 are the most rational and practical implications.', 'सही उत्तर: विकल्प A (1 और 2)।

1. कथन 1 और 2 क्यों सही हैं: परिच्छेद बताता है कि मानसून की मानसूनी वर्षा का स्थानिक व ऋतुनिष्ठ वितरण अत्यधिक विषम है, जिससे देश में एक तरफ सूखा और दूसरी तरफ बाढ़ आती है तथा नदियों का जल व्यर्थ समुद्र में बह जाता है। परिच्छेद जलाशयों में जल संचयन और उसके बाद वितरण की आवश्यकता पर जोर देता है। अतः नदियों का अंतःसंबंधन (1) और बाँधों व नहरों का नेटवर्क बनाना (2) इसके सबसे व्यावहारिक भौतिक समाधान हैं।
2. कथन 3 क्यों गलत है: बोरवेल की खुदाई को बढ़ावा देना भूजल का दोहन बढ़ाता है, जबकि परिच्छेद सतही वर्षा जल के संचयन की बात करता है।
3. कथन 4 और 5 क्यों गलत हैं: कृषि में जल के कानूनी नियंत्रण और केंद्र सरकार द्वारा जल वितरण के नियंत्रण का मुद्दा परिच्छेद के मुख्य विचार (वर्षा जल संचयन अवसंरचना) से सीधा मेल नहीं खाता।

अतः केवल 1 और 2 सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हैं।', NULL),
    ('csat-2020-q23', 23, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Fiscal Policy & Progressive Taxation Assumptions', 'राजकोषीय नीति एवं प्रगतिशील कराधान पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Taxation', 'Income Inequality']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Lower tax rates in a country invariably translate into greater investments in higher education.
2. Investment in the education of children ensures their economic freedom.
3. Economic freedom has a positive impact on building up human capital.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. किसी देश में निम्न कर दर निरपवाद रूप से उच्च शिक्षा में अधिक निवेश के लिए परिणत हो जाती हैं।
2. बच्चों की शिक्षा में निवेश उनकी आर्थिक स्वतंत्रता को सुनिश्चित करता है।
3. आर्थिक स्वतंत्रता का मानव पूँजी निर्माण पर सकारात्मक प्रभाव होता है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', '3 only', '1, 2 and 3', 'केवल 1', 'केवल 2', 'केवल 3', '1, 2 और 3', 'C', 'Correct Answer: Option C (3 only).

1. Why Assumption 3 is valid: The central premise of the passage is that when people are granted economic freedom (such as retaining income due to lower taxes), the return on education rises, motivating individuals and parents to invest in education (which constitutes human capital formation).
2. Why Assumption 1 is invalid: The word "invariably" makes this an extreme generalization; lower tax rates are cited as an example of economic freedom, but they do not automatically guarantee higher education investment in every single case.
3. Why Assumption 2 is invalid: The passage discusses economic freedom as a prerequisite/incentive for investing in education, not that education automatically "ensures" economic freedom (the causality in the passage runs from economic freedom to educational investment).

Therefore, only assumption 3 is valid.', 'सही उत्तर: विकल्प C (केवल 3)।

1. पूर्वधारणा 3 क्यों वैध है: परिच्छेद का मुख्य तर्क है कि आर्थिक स्वतंत्रता मिलने पर शिक्षा पर मिलने वाला प्रतिफल बढ़ता है और लोग शिक्षा में अधिक निवेश करते हैं, जिससे मानव पूँजी निर्माण पर सकारात्मक प्रभाव पड़ता है।
2. पूर्वधारणा 1 क्यों अवैध है: ''निरपवाद रूप से'' (invariably) शब्द इस पूर्वधारणा को अतिवादी बना देता है; निम्न कर दरें आर्थिक स्वतंत्रता का एक कारक हैं, किन्तु वे स्वतः अनिवार्य रूप से उच्च शिक्षा में निवेश की गारंटी नहीं देतीं।
3. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद में आर्थिक स्वतंत्रता को शिक्षा में निवेश का कारण/प्रोत्साहन माना गया है, न कि यह कि शिक्षा अनिवार्य रूप से आर्थिक स्वतंत्रता सुनिश्चित करती है (कारण-प्रभाव का क्रम उल्टा है)।

अतः केवल पूर्वधारणा 3 वैध है।', NULL),
    ('csat-2020-q24', 24, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Crucial Message on Tax Revenues & Inclusive Growth', 'कर राजस्व एवं समावेशी विकास पर महत्वपूर्ण संदेश', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Inclusive Growth', 'Tax Policy']::TEXT[], 'What is the most logical and crucial message conveyed by the passage?', 'परिच्छेद द्वारा संप्रेषित सर्वाधिक तार्किक और निर्णायक संदेश क्या है?', 'Urban local bodies must recover costs through user charges.', 'Urban local bodies are not efficient enough to meet the water requirements of our cities.', 'Water shortage in our cities is a perennial problem that cannot be solved.', 'In view of the water crisis in our cities, there is an urgent need to limit the population of cities by adopting an upper limit of population size.', 'शहरी स्थानीय निकायों को उपभोक्ता शुल्कों के माध्यम से लागत वसूलनी चाहिए।', 'शहरी स्थानीय निकाय हमारे शहरों की जल आवश्यकताओं को पूर्ण करने के लिए पर्याप्त रूप से दक्ष नहीं हैं।', 'हमारे शहरों में जल का अभाव एक चिरस्थायी समस्या है जिसका समाधान सम्भव नहीं है।', 'हमारे शहरों में जल संकट की दृष्टि से यह बहुत आवश्यक है कि शहरों में जनसंख्या का एक अधिकतम आकार निर्धारित कर शहरों की जनसंख्या को सीमित किया जाए।', 'A', 'Correct Answer: Option A (Urban local bodies must recover costs through user charges).

1. Why Option A is correct: The passage emphasizes that sustainable delivery of water requires heavy financial investment across extraction, treatment, distribution, and sewerage. It concludes that cities are not rich enough to fund this entirely on their own, implying that cost-recovery mechanisms (user charges) must be put in place.
2. Why Option B is incorrect: The passage attributes the water problem to financing and resource shortages, not to administrative inefficiency of urban bodies.
3. Why Option C is incorrect: The passage presents financing solutions to ensure sustainable delivery; it does not declare water shortage an insoluble problem.
4. Why Option D is incorrect: Capping city populations is an extreme external suggestion not mentioned in the text.

Therefore, option A is the most logical and crucial message.', 'सही उत्तर: विकल्प A (शहरी स्थानीय निकायों को उपभोक्ता शुल्कों के माध्यम से लागत वसूलनी चाहिए)।

1. विकल्प A क्यों सही है: परिच्छेद स्पष्ट करता है कि जलापूर्ति और सीवरेज प्रबंधन में भारी वित्तीय निवेश की आवश्यकता होती है और शहर इतने समृद्ध नहीं हैं कि निःशुल्क जलापूर्ति कर सकें। अतः धारणीय व्यवस्था के लिए वित्तीयन तंत्र स्थापित करना और उपभोक्ता शुल्कों के माध्यम से लागत वसूलना अनिवार्य है।
2. विकल्प B क्यों गलत है: परिच्छेद शहरी निकायों की अक्षमता पर नहीं बल्कि वित्तीय संसाधनों की कमी पर केंद्रित है।
3. विकल्प C क्यों गलत है: परिच्छेद समस्या को समाधान-विहीन नहीं मानता बल्कि इसके लिए वित्तीय तंत्र की स्थापना का उपाय बताता है।
4. विकल्प D क्यों गलत है: शहरों की जनसंख्या की सीमा तय करने का विचार परिच्छेद में कहीं नहीं है।

अतः विकल्प A सर्वाधिक तार्किक और निर्णायक संदेश है।', NULL),
    ('csat-2020-q25', 25, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing on Urbanization & Spatial Inequality', 'शहरीकरण एवं स्थानिक असमानता पर पूर्वधारणा परीक्षण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Urban Planning', 'Agglomeration']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Rich cities only can ensure sustainable delivery of water.
2. Sustainable delivery of water in cities means much more than supplying water to households.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. केवल धनी शहर ही जल की धारणीय आपूर्ति को सुनिश्चित कर सकते हैं।
2. शहरों में जल की धारणीय आपूर्ति का अर्थ कुटुम्बों को जल की आपूर्ति करने से कहीं अधिक है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'B', 'Correct Answer: Option B (2 only).

1. Why Assumption 2 is valid: The passage elaborates that sustainable water delivery encompasses natural collection, potability treatment, piped distribution, and crucially, sewage infrastructure and wastewater treatment plants to avoid environmental degradation.
2. Why Assumption 1 is invalid: The passage states that if cities were rich enough, water could be delivered *free*, but any city can ensure sustainable water delivery if appropriate financing mechanisms (such as tariffs and cost-recovery) are put in place, not exclusively rich cities.

Therefore, only assumption 2 is valid.', 'सही उत्तर: विकल्प B (केवल 2)।

1. पूर्वधारणा 2 क्यों वैध है: परिच्छेद बताता है कि धारणीय जलापूर्ति में केवल घरों तक पानी पहुँचाना ही शामिल नहीं है, बल्कि जल शोधन, पाइपलाइन नेटवर्क बिछाना, सीवरेज अवसंरचना और अनुपचारित मल-जल को प्राकृतिक जल निकायों में जाने से रोकना भी शामिल है।
2. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद यह कहता है कि यदि शहर धनी होते तो पानी *मुफ़्त* दिया जा सकता था; किन्तु उचित वित्तीय तंत्र स्थापित करके कोई भी शहर धारणीय जलापूर्ति सुनिश्चित कर सकता है, केवल धनी शहर नहीं।

अतः केवल पूर्वधारणा 2 वैध है।', NULL),
    ('csat-2020-q26', 26, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Structural Transformation in Agriculture', 'कृषि में संरचनात्मक रूपांतरण संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Agrarian Economy', 'Rural Distress']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Structural and rural transformation is impossible when farms are mainly small and marginal.
2. A good price incentive can trigger investments in agriculture.
3. India needs to build value chains for high-value agri-products like livestock and horticulture.
4. Higher global prices of agricultural commodities are essential for India''s poverty reduction.
Which of the above assumptions are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जब कृषि जोत मूलतः छोटे और सीमांत हों तब संरचनात्मक और ग्रामीण परिवर्तन असंभव है।
2. अच्छी कीमत प्रोत्साहन कृषि में निवेश को प्रेरित कर सकती है।
3. भारत के लिए उच्च मूल्य के कृषि उत्पादों, जैसे कि पशुधन और बागवानी, के लिए मूल्य-श्रृंखलाओं (value chains) को बनाने की आवश्यकता है।
4. कृषि-माल की उच्च वैश्विक कीमतें भारत के गरीबी-ह्रास के लिए आवश्यक हैं।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?', '1 and 3', '2 and 4', '2 and 3', '3 and 4', '1 और 3', '2 और 4', '2 और 3', '3 और 4', 'C', 'Correct Answer: Option C (2 and 3).

1. Why Assumptions 2 and 3 are valid: The passage demonstrates that when relative prices shifted in favour of agriculture by 50%, private investments surged by over 50%, validating Assumption 2 (price incentives trigger investment). To sustain this agricultural momentum and income growth, building value chains for high-value produce is an established structural prerequisite recognized under this passage''s analytical framework (Assumption 3).
2. Why Assumption 1 is invalid: The passage states that transformation in India was slow compared to China and Vietnam, but it does not claim that transformation is "impossible" with small farms.
3. Why Assumption 4 is invalid: Global prices were one catalyst during 2005-2012, but claiming they are "essential" (indispensable) for all future Indian poverty reduction is an unwarranted extreme assumption.

Therefore, assumptions 2 and 3 are valid.', 'सही उत्तर: विकल्प C (2 और 3)।

1. पूर्वधारणाएँ 2 और 3 क्यों वैध हैं: परिच्छेद स्पष्ट दिखाता है कि जब कीमतें कृषि के पक्ष में 50% बढ़ीं तो निजी निवेश में 50% से अधिक की वृद्धि हुई, जो पूर्वधारणा 2 (अच्छी कीमत प्रोत्साहन निवेश को प्रेरित करता है) को प्रमाणित करता है। कृषि विकास और किसानों की आय को बनाए रखने के लिए उच्च मूल्य उत्पादों की मूल्य-श्रृंखलाओं का निर्माण आवश्यक माना जाता है (पूर्वधारणा 3)।
2. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद छोटे खेतों के कारण परिवर्तन की गति को ''धीमा'' बताता है, इसे ''असंभव'' नहीं कहता।
3. पूर्वधारणा 4 क्यों अवैध है: वैश्विक कीमतें 2005-2012 के दौरान सहायक रहीं, किन्तु यह मानना कि भारत में गरीबी-ह्रास के लिए उच्च वैश्विक कीमतें ''अनिवार्य'' हैं, एक अतिवादी निष्कर्ष है।

अतः पूर्वधारणाएँ 2 और 3 वैध हैं।', NULL),
    ('csat-2020-q27', 27, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Institutional Support for Small Farmers', 'लघु किसानों के संस्थागत समर्थन पर महत्वपूर्ण संदेश', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Smallholder Agriculture', 'Farmer Support']::TEXT[], 'Which one of the following statements best reflects the critical message of the passage?', 'निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'India should create large-scale off-farm rural employment to reduce poverty in the near future.', 'India should create a large number of farmer producer companies.', 'Private investment in agriculture should be given priority over public investment.', 'Inclusive agricultural growth is key to reduce poverty in the near future.', 'निकट भविष्य में भारत की गरीबी कम करने के लिए बड़े पैमाने पर कृषीतर ग्रामीण रोज़गार सृजित करना चाहिए।', 'भारत को बड़े पैमाने पर कृषक उत्पाद कंपनियाँ सृजित करनी चाहिए।', 'कृषि में लोक निवेश की तुलना में निजी निवेश को प्राथमिकता देनी चाहिए।', 'निकट भविष्य में गरीबी कम करने के लिए समावेशी कृषि विकास मुख्य समाधान है।', 'D', 'Correct Answer: Option D (Inclusive agricultural growth is key to reduce poverty in the near future).

1. Why Option D is correct: The passage illustrates that because half of India''s workforce and 85% of farms are small/marginal, the dramatic acceleration in agricultural growth (via better prices, private investment, rising farm wages) led directly to an unprecedented decline in poverty.
2. Why Option A is incorrect: The passage focuses on revitalizing agriculture directly rather than creating off-farm rural employment.
3. Why Option B is incorrect: Farmer producer companies (FPCs) are not mentioned in the passage.
4. Why Option C is incorrect: The passage observes the positive effect of private investment, but does not prescribe subordinating public investment to private investment.

Therefore, option D best reflects the critical message of the passage.', 'सही उत्तर: विकल्प D (निकट भविष्य में गरीबी कम करने के लिए समावेशी कृषि विकास मुख्य समाधान है)।

1. विकल्प D क्यों सही है: परिच्छेद दर्शाता है कि भारत की आधी कार्यबल कृषि में लगी है और 85% किसान छोटे व सीमांत हैं; जब कृषि विकास दर बढ़ी और कृषि मज़दूरी में 7% की वृद्धि हुई, तो देश में गरीबी में अभूतपूर्व गिरावट आई। अतः समावेशी कृषि विकास ही गरीबी उन्मूलन का सबसे प्रभावी उपाय है।
2. विकल्प A क्यों गलत है: परिच्छेद का मुख्य केंद्र कृषि क्षेत्र की प्रगति है, कृषीतर (off-farm) रोज़गार नहीं।
3. विकल्प B क्यों गलत है: कृषक उत्पादक कंपनियों (FPCs) की परिच्छेद में कोई चर्चा नहीं है।
4. विकल्प C क्यों गलत है: परिच्छेद निजी निवेश की वृद्धि का उल्लेख करता है, किन्तु यह लोक निवेश पर निजी निवेश को प्राथमिकता देने की नीतिगत वकालत नहीं करता।

अतः विकल्प D परिच्छेद के क्रांतिक संदेश को सर्वोत्तम रूप से व्यक्त करता है।', NULL),
    ('csat-2020-q28', 28, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Data Sufficiency in Linear Inequality Ordering', 'रैखिक असमानता क्रम में आंकड़े की पर्याप्तता', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Sufficiency', 'Inequalities', 'Ordering']::TEXT[], 'Two Statements S1 and S2 are given below with regard to four numbers P, Q, R and S followed by a Question:
S1: R is greater than P as well as Q.
S2: S is not the largest one.
Question:
Among four numbers P, Q, R and S, which one is the largest?
Which one of the following is correct in respect of the above Statements and the Question?', 'चार संख्याओं P, Q, R और S के संबंध में दो कथन S1 और S2 तथा उनके उपरांत एक प्रश्न दिया गया है:
S1: R, P और Q से बड़ा है।
S2: S सबसे बड़ा नहीं है।
प्रश्न :
चार संख्याओं P, Q, R और S में कौन-सा सबसे बड़ा है?
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'C', 'Correct Answer: Option C (S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question).

1. From S1 alone: $R > P$ and $R > Q$. However, the relative size of $S$ is unknown ($S$ could be greater than $R$). Thus, S1 alone is insufficient.
2. From S2 alone: $S$ is not the largest, but no comparison is given among $P, Q,$ and $R$. Thus, S2 alone is insufficient.
3. Combining S1 and S2: From S1, $R$ is greater than both $P$ and $Q$. From S2, $S$ cannot be the largest. Therefore, the only candidate remaining that can be the largest is $R$.

Therefore, S1 and S2 together are sufficient to answer the Question.', 'सही उत्तर: विकल्प C (दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है)।

1. केवल S1 से: $R > P$ तथा $R > Q$ है, किन्तु $S$ का मान $R$ से बड़ा हो सकता है, अतः S1 अकेला पर्याप्त नहीं है।
2. केवल S2 से: $S$ सबसे बड़ा नहीं है, किन्तु $P, Q, R$ में कौन बड़ा है यह ज्ञात नहीं है, अतः S2 अकेला पर्याप्त नहीं है।
3. S1 और S2 को मिलाने पर: $R$, $P$ और $Q$ दोनों से बड़ा है और $S$ सबसे बड़ा नहीं हो सकता। अतः चारों संख्याओं में सबसे बड़ी संख्या अनिवार्य रूप से $R$ होगी।

अतः दोनों कथन मिलकर प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', NULL),
    ('csat-2020-q29', 29, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Data Sufficiency in Prime Number Testing & Modular Remainders', 'अभाज्य संख्या एवं शेषफल परीक्षण में आंकड़े की पर्याप्तता', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Sufficiency', 'Prime Numbers', 'Modular Arithmetic']::TEXT[], 'Two Statements S1 and S2 are given below followed by a Question:
S1: n is a prime number.
S2: n leaves a remainder of 1 when divided by 4.
Question:
If n is a unique natural number between 10 and 20, then what is n?
Which one of the following is correct in respect of the above Statements and the Question?', 'दो कथन S1 और S2 नीचे दिए गए हैं और उनके उपरांत एक प्रश्न दिया गया है :
S1: n एक अभाज्य संख्या है।
S2 : n को 4 से विभाजित करने पर 1 शेष आता है।
प्रश्न :
यदि n, 10 और 20 के बीच एकमात्र प्राकृतिक संख्या है, तो n क्या है?
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'D', 'Correct Answer: Option D (S1 and S2 together are not sufficient to answer the Question).

1. Natural numbers strictly between 10 and 20 are $\{11, 12, 13, 14, 15, 16, 17, 18, 19\}$.
2. From S1 (prime numbers): $n \in \{11, 13, 17, 19\}$ (multiple values, insufficient).
3. From S2 ($n \equiv 1 \pmod 4$): $n \in \{13, 17\}$ (multiple values, insufficient).
4. Combining S1 and S2: $n$ is a prime number that leaves remainder 1 when divided by 4 $\implies n$ can still be either $13$ ($4 \times 3 + 1$) or $17$ ($4 \times 4 + 1$). Since $n$ cannot be uniquely determined, both statements together remain insufficient.

Therefore, S1 and S2 together are not sufficient to answer the Question.', 'सही उत्तर: विकल्प D (S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं)।

1. 10 और 20 के बीच की प्राकृतिक संख्याएँ $\{11, 12, 13, 14, 15, 16, 17, 18, 19\}$ हैं।
2. कथन S1 से (अभाज्य संख्याएँ): $n \in \{11, 13, 17, 19\}$ (अकेले अपर्याप्त)।
3. कथन S2 से ($n$ को 4 से भाग देने पर 1 शेष): $n \in \{13, 17\}$ (अकेले अपर्याप्त)।
4. S1 और S2 दोनों को मिलाने पर: $n$ एक ऐसी अभाज्य संख्या है जिसमें 4 से भाग देने पर 1 शेष बचे। यहाँ 13 और 17 दोनों इस शर्त को पूरा करती हैं। चूँकि $n$ का एक अद्वितीय मान प्राप्त नहीं होता, अतः दोनों कथन मिलकर भी पर्याप्त नहीं हैं।

अतः S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', NULL),
    ('csat-2020-q30', 30, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Data Sufficiency in Quadratic Number Pairs (Product & Sum)', 'द्विघाती संख्या युग्म (गुणनफल एवं योग) में आंकड़े की पर्याप्तता', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Sufficiency', 'Number Properties', 'Simultaneous Equations']::TEXT[], 'Two Statements S1 and S2 are given below with regard to two numbers followed by a Question:
S1: Their product is 21.
S2: Their sum is 10.
Question:
What are the two numbers?
Which one of the following is correct in respect of the above Statements and the Question?', 'दो संख्याओं के संबंध में दो कथन S1 और S2 नीचे दिए गए हैं और उनके उपरांत एक प्रश्न दिया गया है :
S1: उनका गुणनफल 21 है।
S2: उनका योग 10 है।
प्रश्न :
वे दो संख्याएँ क्या हैं?
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'C', 'Correct Answer: Option C (S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question).

1. Let the two numbers be $x$ and $y$.
2. Statement S1 gives $xy = 21$ (infinite real pairs or multiple integer pairs like $1 \times 21, 3 \times 7$; insufficient).
3. Statement S2 gives $x + y = 10$ (infinite pairs; insufficient).
4. Combining S1 and S2 forms a quadratic equation: $t^2 - (x+y)t + xy = 0 \implies t^2 - 10t + 21 = 0 \implies (t - 3)(t - 7) = 0$. The two roots uniquely identify the set of numbers as $\{3, 7\}$.

Therefore, S1 and S2 together are sufficient to answer the Question.', 'सही उत्तर: विकल्प C (दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है)।

1. माना कि दो संख्याएँ $x$ और $y$ हैं।
2. कथन S1 से: $xy = 21$ (अनेक युग्म संभव हैं, जैसे 1 और 21, 3 और 7; अतः अकेला S1 अपर्याप्त है)।
3. कथन S2 से: $x + y = 10$ (अनेक युग्म संभव हैं; अतः अकेला S2 अपर्याप्त है)।
4. दोनों को मिलाने पर द्विघात समीकरण बनता है: $t^2 - 10t + 21 = 0 \implies (t-3)(t-7)=0$। इससे दोनों संख्याएँ अद्वितीय रूप से 3 और 7 प्राप्त होती हैं।

अतः S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', NULL),
    ('csat-2020-q31', 31, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Direction Sense Test & Spatial Navigation', 'दिशा ज्ञान परीक्षण एवं स्थानिक संचलन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Direction Sense', 'Spatial Logic']::TEXT[], 'A man walks down the backside of his house straight 25 metres, then turns to the right and walks 50 metres again; then he turns towards left and again walks 25 metres. If his house faces to the East, what is his direction from the starting point?', 'एक व्यक्ति अपने घर के पीछे से सीधे 25 मीटर चलता है, फिर वह दाहिने मुड़कर 50 मीटर और चलता है; फिर वह बाएँ मुड़कर पुनः 25 मीटर चलता है। यदि उसके घर का मुख पूर्व की ओर है, तो वह अपने प्रारंभिक बिंदु से किस दिशा में है?', 'South-East', 'South-West', 'North-East', 'North-West', 'दक्षिण-पूर्व', 'दक्षिण-पश्चिम', 'उत्तर-पूर्व', 'उत्तर-पश्चिम', 'D', 'Correct Answer: Option D (North-West).

1. The house faces East $\implies$ walking out the backside means walking towards the **West**.
2. Step 1: Walks $25\text{ m}$ West $\implies$ position $(-25, 0)$.
3. Step 2: Turns right (which is **North** when facing West) and walks $50\text{ m} \implies$ position $(-25, 50)$.
4. Step 3: Turns left (which is **West** when facing North) and walks $25\text{ m} \implies$ final position $(-50, 50)$.
5. Relative to the starting origin $(0, 0)$, the coordinates $(-50, 50)$ lie in the **North-West** quadrant.

Therefore, his direction from the starting point is North-West.', 'सही उत्तर: विकल्प D (उत्तर-पश्चिम)।

1. घर का मुख पूर्व की ओर है, अतः घर के पीछे से निकलने का अर्थ है **पश्चिम** दिशा में चलना।
2. चरण 1: पश्चिम दिशा में 25 मीटर चलता है $\implies$ स्थिति $(-25, 0)$।
3. चरण 2: दाहिने मुड़ता है (पश्चिम दिशा में चलते हुए दाहिना मोड़ **उत्तर** दिशा होगा) और 50 मीटर चलता है $\implies$ स्थिति $(-25, 50)$।
4. चरण 3: बाएँ मुड़ता है (उत्तर दिशा में चलते हुए बायाँ मोड़ **पश्चिम** दिशा होगा) और 25 मीटर चलता है $\implies$ अंतिम स्थिति $(-50, 50)$।
5. प्रारंभिक बिंदु $(0, 0)$ के सापेक्ष बिंदु $(-50, 50)$ **उत्तर-पश्चिम** दिशा में स्थित है।

अतः वह अपने प्रारंभिक बिंदु से उत्तर-पश्चिम दिशा में है।', NULL),
    ('csat-2020-q32', 32, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Deductive Syllogism & Divisibility Predicate Logic', 'न्याय वाक्य (सिलोगिज़्म) एवं विभाज्यता तर्कशास्त्र', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Syllogism', 'Deductive Logic']::TEXT[], 'Two Statements are given followed by two Conclusions:
Statements:
All numbers are divisible by 2.
All numbers are divisible by 3.
Conclusion-I:
All numbers are divisible by 6.
Conclusion-II:
All numbers are divisible by 4.
Which of the above Conclusions logically follows/follow from the two given Statements?', 'नीचे दो कथन दिए गए हैं जिनके बाद दो निष्कर्ष दिए गए हैं:
कथन :
सभी संख्याएँ 2 से विभाज्य हैं।
सभी संख्याएँ 3 से विभाज्य हैं।
निष्कर्ष-I :
सभी संख्याएँ 6 से विभाज्य हैं।
निष्कर्ष-II :
सभी संख्याएँ 4 से विभाज्य हैं।
ऊपर लिखे हुए निष्कर्षों में से कौन-सा/से दिए गए दो कथनों से तार्किक रूप से निकाला/निकाले जा सकता/सकते है/हैं?', 'Only Conclusion-I', 'Only Conclusion-II', 'Neither Conclusion-I nor Conclusion-II', 'Both Conclusion-I and Conclusion-II', 'केवल निष्कर्ष-I', 'केवल निष्कर्ष-II', 'न तो निष्कर्ष-I, न ही निष्कर्ष-II', 'दोनों निष्कर्ष-I और निष्कर्ष-II', 'A', 'Correct Answer: Option A (Only Conclusion-I).

1. If a number is divisible by 2 and also divisible by 3, it must be divisible by $\text{LCM}(2, 3) = 6$. Therefore, Conclusion-I logically follows.
2. Divisibility by 2 does not necessarily imply divisibility by $4 = 2^2$ (e.g., 6 is divisible by 2 and 3, but not divisible by 4). Therefore, Conclusion-II does not follow.

Therefore, only Conclusion-I logically follows.', 'सही उत्तर: विकल्प A (केवल निष्कर्ष-I)।

1. यदि कोई संख्या 2 से विभाज्य है और 3 से भी विभाज्य है, तो वह उनके ल.स.प. $\text{LCM}(2, 3) = 6$ से भी अनिवार्य रूप से विभाज्य होगी। अतः निष्कर्ष-I तार्किक रूप से निकलता है।
2. 2 और 3 से विभाज्य होने का अर्थ यह नहीं है कि वह संख्या 4 से भी विभाज्य होगी (उदाहरणार्थ: 6, 2 और 3 से विभाज्य है किन्तु 4 से नहीं)। अतः निष्कर्ष-II नहीं निकलता।

अतः केवल निष्कर्ष-I सही है।', NULL),
    ('csat-2020-q33', 33, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Categorical Syllogism & Venn Diagram Deductions', 'वर्गिक न्याय वाक्य एवं वेन आरेख निष्कर्ष', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Syllogism', 'Venn Diagrams']::TEXT[], 'Two Statements are given followed by two Conclusions:
Statements:
All cats are dogs.
All cats are black.
Conclusion-I:
All dogs are black.
Conclusion-II:
Some dogs are not black.
Which of the above Conclusions logically follows/follow from the two given Statements, disregarding commonly known facts?', 'नीचे दो कथन दिए गए हैं जिनके बाद दो निष्कर्ष दिए गए हैं:
कथन :
सभी बिल्लियाँ कुत्ते हैं।
सभी बिल्लियाँ काली हैं।
निष्कर्ष-I :
सभी कुत्ते काले हैं।
निष्कर्ष-II :
कुछ कुत्ते काले नहीं हैं।
सामान्य ज्ञात तथ्यों की उपेक्षा करते हुए, ऊपर लिखे हुए निष्कर्षों में से कौन-सा/से दिए गए दो कथनों से तार्किक रूप से निकाला/निकाले जा सकता/सकते है/हैं?', 'Only Conclusion-I', 'Only Conclusion-II', 'Neither Conclusion-I nor Conclusion-II', 'Both Conclusion-I and Conclusion-II', 'केवल निष्कर्ष-I', 'केवल निष्कर्ष-II', 'न तो निष्कर्ष-I, न ही निष्कर्ष-II', 'दोनों निष्कर्ष-I और निष्कर्ष-II', 'C', 'Correct Answer: Option C (Neither Conclusion-I nor Conclusion-II).

1. From the statements "All cats are dogs" and "All cats are black", we can deduce that the subset of dogs that are cats are black, which yields the valid conclusion: "Some dogs are black".
2. Conclusion-I ("All dogs are black") is not necessarily true because there may be dogs that are not cats and not black.
3. Conclusion-II ("Some dogs are not black") is also not necessarily true because it is possible that all dogs happen to be black.

Therefore, neither Conclusion-I nor Conclusion-II logically follows.', 'सही उत्तर: विकल्प C (न तो निष्कर्ष-I, न ही निष्कर्ष-II)।

1. दिए गए कथनों "सभी बिल्लियाँ कुत्ते हैं" और "सभी बिल्लियाँ काली हैं" से केवल यह निश्चित निष्कर्ष निकलता है कि "कुछ कुत्ते काले हैं" (जो बिल्लियाँ हैं)।
2. निष्कर्ष-I ("सभी कुत्ते काले हैं") आवश्यक रूप से सत्य नहीं है क्योंकि बिल्लियों के अलावा अन्य कुत्ते काले न भी हों।
3. निष्कर्ष-II ("कुछ कुत्ते काले नहीं हैं") भी निश्चित रूप से सत्य नहीं है क्योंकि संभव है कि सभी कुत्ते काले ही हों।

अतः न तो निष्कर्ष-I और न ही निष्कर्ष-II तार्किक रूप से निकलता है।', NULL),
    ('csat-2020-q34', 34, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Conditional Odd-Even Sequence Counting', 'प्रतिबंधित सम-विषम अनुक्रम गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Number Sequence', 'Pattern Recognition']::TEXT[], 'Consider the following sequence of numbers:
$$5\ 1\ 4\ 7\ 3\ 9\ 8\ 5\ 7\ 2\ 6\ 3\ 1\ 5\ 8\ 6\ 3\ 8\ 5\ 2\ 2\ 4\ 3\ 4\ 9\ 6$$
How many odd numbers are followed by the odd number in the above sequence?', 'निम्नलिखित संख्याओं के अनुक्रम पर विचार कीजिए:
$$5\ 1\ 4\ 7\ 3\ 9\ 8\ 5\ 7\ 2\ 6\ 3\ 1\ 5\ 8\ 6\ 3\ 8\ 5\ 2\ 2\ 4\ 3\ 4\ 9\ 6$$
ऊपर लिखे हुए अनुक्रम में कितनी विषम संख्याओं के बाद विषम संख्या आती है?', '5', '6', '7', '8', '5', '6', '7', '8', 'B', 'Correct Answer: Option B (6).

1. Scan the sequence for every instance where an odd number is immediately followed by another odd number:
   * **(5, 1)** $\rightarrow$ 5 is odd, followed by 1 (odd) [Match 1]
   * **(7, 3)** $\rightarrow$ 7 is odd, followed by 3 (odd) [Match 2]
   * **(3, 9)** $\rightarrow$ 3 is odd, followed by 9 (odd) [Match 3]
   * **(5, 7)** $\rightarrow$ 5 is odd, followed by 7 (odd) [Match 4]
   * **(3, 1)** $\rightarrow$ 3 is odd, followed by 1 (odd) [Match 5]
   * **(1, 5)** $\rightarrow$ 1 is odd, followed by 5 (odd) [Match 6]
2. All other odd numbers in the sequence (e.g., 9, 7, 5, 3, 5, 3, 9) are followed by even numbers.

Therefore, there are 6 such odd numbers in the sequence.', 'सही उत्तर: विकल्प B (6)।

1. अनुक्रम में ऐसी विषम संख्याओं की पहचान करने पर जिनके तुरंत बाद एक विषम संख्या आती है:
   * **(5, 1)** $\rightarrow$ 5 के बाद 1 (विषम) [युग्म 1]
   * **(7, 3)** $\rightarrow$ 7 के बाद 3 (विषम) [युग्म 2]
   * **(3, 9)** $\rightarrow$ 3 के बाद 9 (विषम) [युग्म 3]
   * **(5, 7)** $\rightarrow$ 5 के बाद 7 (विषम) [युग्म 4]
   * **(3, 1)** $\rightarrow$ 3 के बाद 1 (विषम) [युग्म 5]
   * **(1, 5)** $\rightarrow$ 1 के बाद 5 (विषम) [युग्म 6]
2. अनुक्रम में अन्य सभी विषम संख्याओं के बाद सम संख्याएँ आती हैं।

अतः ऐसी विषम संख्याओं की कुल संख्या 6 है।', NULL),
    ('csat-2020-q35', 35, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Linear Order, Ranking & Left-Right Position Shifting', 'रैखिक क्रम व्यवस्था, रैंकिंग एवं स्थिति परिवर्तन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Order and Ranking', 'Linear Arrangement']::TEXT[], 'A is 16th from the left end in a row of boys and V is 18th from the right end. G is 11th from A towards the right and 3rd from V towards the right end. How many boys are there in the row?', 'लड़कों की एक पंक्ति में A बाएँ छोर से 16वें स्थान पर और V दाएँ छोर से 18वें स्थान पर है। G, A की दाईं ओर 11वें और V से तीसरे स्थान पर दाहिने छोर की ओर है। पंक्ति में कितने लड़के हैं?', '40', '41', '42', 'Cannot be determined due to insufficient data', '40', '41', '42', 'अपर्याप्त आँकड़ों के कारण निर्धारित नहीं किया जा सकता है', 'B', 'Correct Answer: Option B (41).

1. Position of A from the left end $= 16$.
2. G is 11th to the right of A $\implies$ Position of G from the left end $= 16 + 11 = 27$.
3. V is 18th from the right end. G is 3rd from V towards the right end $\implies$ Position of G from the right end $= 18 - 3 = 15$.
4. Total number of boys in the row $= (\text{Position of G from left}) + (\text{Position of G from right}) - 1 = 27 + 15 - 1 = 41$.

Therefore, there are 41 boys in the row.', 'सही उत्तर: विकल्प B (41)।

1. बाएँ छोर से A का स्थान $= 16$वाँ।
2. G, A के दाईं ओर 11वें स्थान पर है $\implies$ बाएँ छोर से G का स्थान $= 16 + 11 = 27$वाँ।
3. दाएँ छोर से V का स्थान $= 18$वाँ। G, V से 3 स्थान दाएँ छोर की ओर है $\implies$ दाएँ छोर से G का स्थान $= 18 - 3 = 15$वाँ।
4. पंक्ति में लड़कों की कुल संख्या $= (\text{बाएँ से G का स्थान}) + (\text{दाएँ से G का स्थान}) - 1 = 27 + 15 - 1 = 41$।

अतः पंक्ति में कुल 41 लड़के हैं।', NULL),
    ('csat-2020-q36', 36, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', '3-Statement Data Sufficiency in Age Ordering Logic', 'आयु क्रम तर्क में 3-कथन आंकड़े की पर्याप्तता', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Sufficiency', 'Age Ordering', 'Inequality Chains']::TEXT[], 'Three Statements S1, S2 and S3 are given below followed by a Question:
S1: C is younger than D, but older than A and B.
S2: D is the oldest.
S3: A is older than B.
Question:
Who among A, B, C and D is the youngest?
Which one of the following is correct in respect of the above Statements and the Question?', 'तीन कथन S1, S2 और S3 नीचे दिए गए हैं जिसके उपरांत एक प्रश्न है :
S1: C, D से छोटा पर A और B से बड़ा है।
S2: D सबसे बड़ा है।
S3: A, B से बड़ा है।
प्रश्न :
A, B, C और D में से सबसे छोटा कौन है?
निम्नलिखित में से कौन-सा ऊपर लिखे हुए कथनों और प्रश्न के संदर्भ में सही है?', 'S1 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question.', 'S2 and S3 together are sufficient to answer the Question.', 'S1 and S3 together are sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'S2 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'S1 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'D', 'Correct Answer: Option D (S1 and S3 together are sufficient to answer the Question).

1. From S1: $D > C > A$ and $D > C > B$. This establishes that both $D$ and $C$ are older than $A$ and $B$, but does not specify whether $A$ or $B$ is the youngest.
2. From S3: $A > B$.
3. Combining S1 and S3 establishes the complete descending age order: $D > C > A > B$, uniquely identifying $B$ as the youngest person.

Therefore, S1 and S3 together are sufficient to answer the Question.', 'सही उत्तर: विकल्प D (S1 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं)।

1. कथन S1 से: $D > C > A$ तथा $D > C > B$। इससे यह पता चलता है कि $D$ और $C$, $A$ और $B$ दोनों से बड़े हैं, किन्तु $A$ और $B$ में कौन छोटा है यह ज्ञात नहीं होता।
2. कथन S3 से: $A > B$।
3. S1 और S3 को मिलाने पर पूर्ण क्रम $D > C > A > B$ प्राप्त होता है, जिससे निश्चित रूप से सिद्ध होता है कि $B$ सबसे छोटा है।

अतः S1 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', NULL),
    ('csat-2020-q37', 37, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Inclusion Counting & Divisibility Exclusion', 'अंक समावेश गणना एवं विभाज्यता अपवर्जन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Digit Counting', 'Divisibility by 4']::TEXT[], 'How many integers are there between 1 and 100 which have 4 as a digit but are not divisible by 4?', '1 और 100 के मध्य कितनी ऐसी पूर्ण संख्याएँ हैं जिनमें एक अंक 4 है लेकिन वे 4 से विभाज्य नहीं हैं?', '5', '11', '12', '13', '5', '11', '12', '13', 'C', 'Correct Answer: Option C (12).

1. List all integers strictly between 1 and 100 that contain the digit 4:
   * 4 in the units place: $\{4, 14, 24, 34, 44, 54, 64, 74, 84, 94\}$ (10 numbers)
   * 4 in the tens place: $\{40, 41, 42, 43, 44, 45, 46, 47, 48, 49\}$ (10 numbers, with 44 counted in both)
   * Total unique integers containing digit 4 = $10 + 10 - 1 = 19$ numbers.
2. Filter out those that are divisible by 4:
   * Divisible by 4: $\{4, 24, 40, 44, 48, 64, 84\}$ (7 numbers).
3. Integers containing 4 but NOT divisible by 4:
   * $\{14, 34, 41, 42, 43, 45, 46, 47, 49, 54, 74, 94\}$
   * Total count $= 19 - 7 = 12$.

Therefore, there are 12 such integers.', 'सही उत्तर: विकल्प C (12)।

1. 1 और 100 के बीच अंक 4 वाली सभी संख्याएँ:
   * इकाई अंक 4 वाली: $\{4, 14, 24, 34, 44, 54, 64, 74, 84, 94\}$
   * दहाई अंक 4 वाली: $\{40, 41, 42, 43, 44, 45, 46, 47, 48, 49\}$
   * अंक 4 वाली कुल अद्वितीय संख्याएँ $= 19$।
2. इनमें से 4 से विभाज्य संख्याएँ: $\{4, 24, 40, 44, 48, 64, 84\}$ (कुल 7 संख्याएँ)।
3. 4 अंक वाली किन्तु 4 से अविभाज्य संख्याएँ:
   * $\{14, 34, 41, 42, 43, 45, 46, 47, 49, 54, 74, 94\}$
   * कुल संख्या $= 19 - 7 = 12$।

अतः ऐसी कुल 12 संख्याएँ हैं।', NULL),
    ('csat-2020-q38', 38, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', '3D Solid Cube Volume Ratios & Density Equations', '3D ठोस घन आयतन अनुपात एवं घनत्व समीकरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Mensuration & Geometry', 'Cubes', 'Volume & Density']::TEXT[], 'Let x, y be the volumes; m, n be the masses of two metallic cubes P and Q respectively. Each side of Q is two times that of P and mass of Q is two times that of P. Let $u=m/x$ and $v=n/y$. Which one of the following is correct?', 'माना कि दो धातु के घनों P और Q के क्रमशः x, y आयतन हैं; m, n द्रव्यमान हैं। Q की प्रत्येक भुजा P की दोगुनी है और Q का द्रव्यमान P का दोगुना है। माना कि $u=m/x$ और $v=n/y$ है। निम्नलिखित में से कौन-सा सही है?', 'u = 4v', 'u = 2v', 'v = u', 'v = 4u', 'u = 4v', 'u = 2v', 'v = u', 'v = 4u', 'A', 'Correct Answer: Option A ($u = 4v$).

1. Let the side length of cube P be $a$. The volume of cube P is $x = a^3$.
2. The side length of cube Q is $2a$. The volume of cube Q is $y = (2a)^3 = 8a^3 = 8x$.
3. The mass of P is $m$, and the mass of Q is $n = 2m$.
4. Express the ratios:
   * $u = \frac{m}{x}$
   * $v = \frac{n}{y} = \frac{2m}{8x} = \frac{1}{4} \left(\frac{m}{x}\right) = \frac{u}{4}$
5. Cross-multiplying gives $u = 4v$.

Therefore, $u = 4v$ is correct.', 'सही उत्तर: विकल्प A ($u = 4v$)।

1. माना घन P की भुजा $a$ है, अतः P का आयतन $x = a^3$ होगा।
2. घन Q की भुजा $2a$ है, अतः Q का आयतन $y = (2a)^3 = 8a^3 = 8x$ होगा।
3. P का द्रव्यमान $m$ है तथा Q का द्रव्यमान $n = 2m$ है।
4. दिए गए अनुपातों से:
   * $u = \frac{m}{x}$
   * $v = \frac{n}{y} = \frac{2m}{8x} = \frac{1}{4}\left(\frac{m}{x}\right) = \frac{u}{4}$
5. हल करने पर: $u = 4v$।

अतः $u = 4v$ सही उत्तर है।', NULL),
    ('csat-2020-q39', 39, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Average Age Calculation & Multi-Variable Age System', 'औसत आयु गणना एवं बहु-चर आयु प्रणाली', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Age Problems']::TEXT[], 'The average age of a teacher and three students is 20 years. If all the three students are of same age and the difference between the age of the teacher and each student is 20 years, then what is the age of the teacher?', 'एक शिक्षक और तीन छात्रों की औसत आयु 20 वर्ष है। यदि तीनों छात्र समान आयु के हों और शिक्षक तथा प्रत्येक छात्र की आयु का अंतर 20 वर्ष हो, तो शिक्षक की आयु कितनी है?', '25 years', '30 years', '35 years', '45 years', '25 वर्ष', '30 वर्ष', '35 वर्ष', '45 वर्ष', 'C', 'Correct Answer: Option C (35 years).

1. Let the age of each student be $S$ and the age of the teacher be $T$.
2. Total sum of ages of the 4 individuals is:
   $$T + 3S = 4 \times 20 = 80$$
3. The difference between the age of the teacher and each student is 20 years:
   $$T - S = 20 \implies S = T - 20$$
4. Substitute $S$ into the sum equation:
   $$T + 3(T - 20) = 80$$
   $$4T - 60 = 80 \implies 4T = 140 \implies T = 35$$

Therefore, the age of the teacher is 35 years.', 'सही उत्तर: विकल्प C (35 वर्ष)।

1. माना प्रत्येक छात्र की आयु $S$ वर्ष तथा शिक्षक की आयु $T$ वर्ष है।
2. 4 व्यक्तियों (1 शिक्षक + 3 छात्र) की कुल आयु का योग:
   $$T + 3S = 4 \times 20 = 80$$
3. शिक्षक और छात्र की आयु का अंतर 20 वर्ष है:
   $$T - S = 20 \implies S = T - 20$$
4. समीकरण में मान रखने पर:
   $$T + 3(T - 20) = 80$$
   $$4T - 60 = 80 \implies 4T = 140 \implies T = 35$$

अतः शिक्षक की आयु 35 वर्ष है।', NULL),
    ('csat-2020-q40', 40, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Cost Price, Selling Price & Loss Percentage Calculation', 'क्रय मूल्य, विक्रय मूल्य एवं हानि प्रतिशत गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Profit and Loss', 'Commercial Math']::TEXT[], 'A person bought a car and sold it for ₹3,00,000. If he incurred a loss of 20%, then how much did he spend to buy the car?', 'एक व्यक्ति ने एक कार खरीदी और ₹3,00,000 में बेच दी। यदि उसे 20% की हानि उठानी पड़ी, तो उसने कार खरीदने में कितने रुपये खर्च किए ?', '3,60,000', '3,65,000', '3,70,000', '3,75,000', '3,60,000', '3,65,000', '3,70,000', '3,75,000', 'D', 'Correct Answer: Option D (3,75,000).

1. Let the cost price ($CP$) of the car be $C$.
2. Selling Price ($SP$) is ₹3,00,000 after a 20% loss:
   $$SP = C \times (1 - 0.20) = 0.80 C$$
3. Calculate $C$:
   $$0.80 C = 3,00,000 \implies C = \frac{3,00,000}{0.80} = \frac{3,00,000 \times 5}{4} = 3,75,000$$

Therefore, he spent ₹3,75,000 to buy the car.', 'सही उत्तर: विकल्प D (3,75,000)।

1. माना कार का क्रय मूल्य ($CP$) ₹$C$ है।
2. 20% हानि के उपरांत विक्रय मूल्य ($SP$) ₹3,00,000 है:
   $$SP = C \times (100\% - 20\%) = 0.80 C$$
3. क्रय मूल्य की गणना करने पर:
   $$0.80 C = 3,00,000 \implies C = \frac{3,00,000}{0.80} = 3,75,000$$

अतः उसने कार खरीदने में ₹3,75,000 खर्च किए।', NULL),
    ('csat-2020-q41', 41, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Groundwater Depletion & Irrigation Management', 'भूजल ह्रास एवं सिंचाई प्रबंधन पर महत्वपूर्ण संदेश', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Groundwater', 'Water Policy']::TEXT[], 'Which one of the following statements best reflects the critical message of the passage?', 'निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'For introducing any foreign plant into a country, the soil and climate conditions of that country should be suitable.', 'As a staple food of a country, tuber crops like potato cannot replace cereal crops.', 'Some of the fungal infections of plants cannot be prevented or stopped from spreading across large areas.', 'Relying on a homogeneous food source is not desirable.', 'किसी विदेशी पादप को किसी देश में समाविष्ट करने के लिए उस देश की भूमि और जलवायु दशाएँ उपयुक्त होनी चाहिए।', 'किसी देश के प्रधान खाद्य के रूप में आलू जैसी कंद वाली फसलें, धान्य फसलों का स्थान नहीं ले सकतीं।', 'पादपों के कुछ कवक संक्रमणों को बड़े क्षेत्रों में फैलने से बाधित किया या रोका नहीं जा सकता।', 'किसी समांगी खाद्य स्रोत पर निर्भर होना वांछनीय नहीं है।', 'D', 'Correct Answer: Option D (Relying on a homogeneous food source is not desirable).

1. Why Option D is correct: The passage illustrates how the Irish population relied almost exclusively on a single, genetically uniform variety of potato (''Lumper''). When a fungal pathogen struck, this genetic frailty caused catastrophic crop failure and widespread famine, demonstrating the severe danger of relying on a homogeneous food source.
2. Why Option A is incorrect: The passage notes that potatoes adapted well to Ireland''s cold, wet soil and served reliably for decades; soil and climate mismatch was not the cause of the disaster.
3. Why Option B is incorrect: The passage shows that potatoes did successfully serve as a staple food; the failure stemmed from monoculture and genetic homogeneity, not the inherent nature of tuber crops versus cereals.
4. Why Option C is incorrect: The central lesson is about avoiding extreme genetic vulnerability in agriculture, not a fatalistic claim about the uncontrollability of fungal pathogens.

Therefore, relying on a homogeneous food source is not desirable is the critical message.', 'सही उत्तर: विकल्प D (किसी समांगी खाद्य स्रोत पर निर्भर होना वांछनीय नहीं है)।

1. विकल्प D क्यों सही है: परिच्छेद दर्शाता है कि आयरलैंड के लोग लगभग पूरी तरह आलू की एक ही आनुवंशिक किस्म (''लम्पर'') पर निर्भर हो गए थे। जब फफूंद का संक्रमण फैला, तो इस आनुवंशिक एकरूपता (समांगता) के कारण पूरी फसल नष्ट हो गई और भीषण अकाल पड़ा। यह साबित करता है कि किसी समांगी खाद्य स्रोत पर अत्यधिक निर्भरता खतरनाक और अवांछनीय है।
2. विकल्प A क्यों गलत है: परिच्छेद बताता है कि आयरलैंड की जलवायु आलू के अनुकूल थी और उसने दशकों तक खाद्य सुरक्षा दी; समस्या जलवायु की अनुपयुक्तता नहीं थी।
3. विकल्प B क्यों गलत है: परिच्छेद यह नहीं कहता कि कंद फसलें धान्य फसलों का स्थान नहीं ले सकतीं, बल्कि विफलता का कारण एक ही फसल किस्म पर पूर्ण निर्भरता था।
4. विकल्प C क्यों गलत है: परिच्छेद का मुख्य उद्देश्य कवक संक्रमण की अजेयता बताना नहीं, बल्कि एकल-फसल (मोनोकल्चर) के जोखिम को उजागर करना है।

अतः किसी समांगी खाद्य स्रोत पर निर्भर न होना परिच्छेद का सर्वोत्तम क्रांतिक संदेश है।', NULL),
    ('csat-2020-q42', 42, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Practical Implications for Water Pricing & Crop Pattern Shifting', 'जल मूल्य निर्धारण एवं फसल चक्र बदलाव के व्यावहारिक निहितार्थ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Irrigation Policy', 'Crop Diversification']::TEXT[], 'With reference to the above passage, which of the following is/are the most rational and practical implication/implications?
1. India''s Public Distribution System should be monitored by the Union Government.
2. Girls should be encouraged to delay marriage and first pregnancy.
3. Mothers should be encouraged to breastfeed their children immediately after birth.
4. The supply of safe drinking water and proper sanitation facilities to all should be ensured.
5. Authorities should ensure the vaccination as prescribed.
Select the correct answer using the code given below.', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ है/हैं?
1. भारत की सार्वजनिक वितरण प्रणाली को केन्द्र सरकार द्वारा मॉनीटर किया जाना चाहिए।
2. बालिकाओं को विवाह एवं प्रथम गर्भ विलम्बित करने के लिए प्रोत्साहित करना चाहिए।
3. जन्म के तुरंत बाद नवजात को स्तनपान कराने हेतु माताओं को प्रोत्साहित करना चाहिए।
4. सभी के लिए सुरक्षित पेय जल एवं उपयुक्त स्वच्छता सुविधाओं की आपूर्ति सुनिश्चित करनी चाहिए।
5. प्राधिकारियों को यथानिर्धारित टीकाकरण सुनिश्चित करना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1, 2, 3 and 4', '2, 3, 4 and 5', '1 only', '3 and 5 only', '1, 2, 3 और 4', '2, 3, 4 और 5', 'केवल 1', 'केवल 3 और 5', 'B', 'Correct Answer: Option B (2, 3, 4 and 5).

1. Why Statements 2, 3, 4, and 5 are correct: The passage focuses on the high burden of child undernutrition, stunting under age 5, and child mortality. Standard maternal-child healthcare and nutrition frameworks establish that delaying marriage/pregnancy (2), promoting immediate breastfeeding (3), ensuring clean water/sanitation to prevent infection-driven nutrient loss (4), and complete immunization (5) are the fundamental, direct practical measures required to combat child stunting and mortality.
2. Why Statement 1 is incorrect: Centralizing the monitoring of the Public Distribution System (PDS) under the Union Government is an administrative/structural mechanism not directly addressed in the passage, and grain distribution alone does not solve the multifaceted biological and sanitation causes of early childhood stunting.

Therefore, 2, 3, 4, and 5 are the most rational and practical implications.', 'सही उत्तर: विकल्प B (2, 3, 4 और 5)।

1. कथन 2, 3, 4 और 5 क्यों सही हैं: परिच्छेद में बच्चों में कुपोषण, 5 वर्ष से कम आयु में ठिगनेपन (stunting) और बाल मृत्यु दर की गंभीर स्थिति का उल्लेख है। स्वास्थ्य नीति के अनुसार बाल कुपोषण को रोकने के लिए बालिकाओं के विवाह और गर्भधारण में देरी (2), जन्म के तुरंत बाद स्तनपान (3), संक्रमण रोकने हेतु स्वच्छ जल व स्वच्छता (4), तथा बीमारियों से बचाव हेतु समय पर टीकाकरण (5) सबसे व्यावहारिक और प्रत्यक्ष उपाय हैं।
2. कथन 1 क्यों गलत है: सार्वजनिक वितरण प्रणाली (PDS) की निगरानी केवल केंद्र सरकार को सौंपना एक प्रशासनिक विकल्प है, जिसकी चर्चा परिच्छेद में नहीं है और यह कुपोषण के बहु-आयामी स्वास्थ्य कारणों का संपूर्ण समाधान नहीं है।

अतः केवल 2, 3, 4 और 5 सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हैं।', NULL),
    ('csat-2020-q43', 43, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Rational Inferences on Global Geopolitics & Regional Groupings', 'वैश्विक भू-राजनीति एवं क्षेत्रीय गुटों पर तर्कसंगत निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'International Relations', 'Multilateralism']::TEXT[], 'Which of the following are the most rational inferences that can be made from the passage?
1. Farmers'' income will be higher with pulse cultivation than with paddy cultivation.
2. Pulse cultivation causes less pollution as compared to paddy cultivation.
3. Pulse straw can be used to improve soil quality.
4. In the context of northern Indian agriculture, paddy straw has no usefulness.
5. Mechanized agriculture is the main cause for stubble burning.
Select the correct answer using the code given below.', 'निम्नलिखित में से कौन-से ऐसे सर्वाधिक तर्कसंगत निष्कर्ष हैं जो उपर्युक्त परिच्छेद से निकाले जा सकते हैं?
1. धान की तुलना में दलहन उगाने से कृषकों की आय अधिक होगी।
2. दलहन उगाना, धान उगाने की तुलना में कम प्रदूषण उत्पन्न करता है।
3. दलहन के पुआल का प्रयोग मृदा की गुणवत्ता में सुधार लाने के लिए किया जा सकता है।
4. उत्तरी भारत की कृषि के संदर्भ में, धान के पुआल की कोई उपयोगिता नहीं है।
5. मशीनीकृत खेती ठूंठ जलाने का प्रमुख कारक है।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '2, 3 and 5', '1, 4 and 5', '2 and 3 only', '1 and 4 only', '2, 3 और 5', '1, 4 और 5', 'केवल 2 और 3', 'केवल 1 और 4', 'C', 'Correct Answer: Option C (2 and 3 only).

1. Why Inferences 2 and 3 are correct: The passage explains that Arhar straw is green and easily decomposed when ploughed back into the soil, directly improving soil quality (3). In contrast, paddy straw has high silica, resists decomposition, and is burnt by farmers, causing pollution; thus, cultivating pulses leads to less stubble burning and less pollution (2).
2. Why Inference 1 is incorrect: The passage compares yield per hectare of ''Pusa Arhar 16'' with existing pulse varieties, but does not state that net income from pulses exceeds that from paddy.
3. Why Inference 4 is incorrect: The passage states that paddy straw is difficult to decompose or plough back, not that it possesses zero usefulness in all contexts.
4. Why Inference 5 is incorrect: Farmers burn stubble because high silica prevents easy decomposition, not because agricultural mechanization itself is the primary root cause.

Therefore, only inferences 2 and 3 are correct.', 'सही उत्तर: विकल्प C (केवल 2 और 3)।

1. निष्कर्ष 2 और 3 क्यों सही हैं: परिच्छेद बताता है कि अरहर का पुआल हरा होता है और मिट्टी में जुताई करने पर तेजी से अपघटित होकर खाद बनता है, जिससे मृदा की गुणवत्ता में सुधार होता है (3)। चूँकि धान के पुआल में सिलिका अधिक होने के कारण उसे जलाना पड़ता है, अतः दलहन उगाने से पराली दहन और प्रदूषण कम होता है (2)।
2. निष्कर्ष 1 क्यों गलत है: परिच्छेद ''पूसा अरहर 16'' की उत्पादकता की तुलना अन्य दलहन किस्मों से करता है, यह धान की तुलना में कुल किसान आय अधिक होने का दावा नहीं करता।
3. निष्कर्ष 4 क्यों गलत है: परिच्छेद धान के पुआल के अपघटन की कठिनाई बताता है, यह नहीं कहता कि उसकी कोई उपयोगिता नहीं है।
4. निष्कर्ष 5 क्यों गलत है: किसान पुआल इसलिए जलाते हैं क्योंकि धान के डंठल आसानी से गलते नहीं हैं, मशीनीकरण इसका मूल कारण नहीं है।

अतः केवल 2 और 3 सर्वाधिक तर्कसंगत निष्कर्ष हैं।', NULL),
    ('csat-2020-q44', 44, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Multilateral Governance & Global Hegemony', 'बहुपक्षीय शासन एवं वैश्विक प्रभुत्व संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Global Governance', 'Critical Assumptions']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. High risks involved in holding maximum water in reservoirs are due to our over-dependence on hydropower projects.
2. Storage capacity of dams should not be fully used before or during monsoon season.
3. Role of dams in flood control is underestimated in India.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जलाशयों में अधिकतम जल संचयन में होने वाले भारी जोखिम, जलशक्ति परियोजनाओं पर हमारी अत्यधिक निर्भरता के कारण है।
2. बाँधों की संग्रहण क्षमता का मानसून ऋतु के पूर्व अथवा दौरान पूर्ण उपयोग नहीं किया जाना चाहिए।
3. भारत में बाढ़ नियंत्रण के लिए बाँधों की भूमिका को कम करके आँका गया है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 and 2 only', '2 only', '3 only', '1, 2 and 3', 'केवल 1 और 2', 'केवल 2', 'केवल 3', '1, 2 और 3', 'D', 'Correct Answer: Option D (1, 2 and 3).

1. Why Assumption 1 is valid: The passage explicitly states that authorities store maximum water prematurely "only to ensure greater electricity generation and irrigation," directly linking the operational risk to the heavy reliance on hydropower and irrigation storage.
2. Why Assumption 2 is valid: The passage highlights the accepted international standard that reservoir water levels must be kept below maximum capacity before and during the monsoon to retain buffer space for floodwaters.
3. Why Assumption 3 is valid: Because authorities routinely prioritize filling reservoirs for power generation over keeping flood cushion space, the flood moderation role of dams is subordinated and underestimated in practice.

Therefore, all assumptions 1, 2, and 3 are valid.', 'सही उत्तर: विकल्प D (1, 2 और 3)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद बताता है कि जलाशय में पूर्ण भराव का जोखिम केवल अधिक जलविद्युत उत्पादन और सिंचाई सुनिश्चित करने के लिए उठाया जाता है, जो जलशक्ति और भंडारण पर अत्यधिक निर्भरता को दर्शाता है।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद के अनुसार अंतरराष्ट्रीय नियम यह है कि मानसून के आगमन पर अतिरिक्त वर्षा जल को रोकने के लिए बाँधों को पूरा नहीं भरा जाना चाहिए।
3. पूर्वधारणा 3 क्यों वैध है: बाँधों में बाढ़ नियंत्रण के लिए जगह छोड़ने के बजाय बिजली उत्पादन को प्राथमिकता देना यह सिद्ध करता है कि भारत में बाढ़ नियंत्रण में बाँधों की भूमिका को कम आँका गया है।

अतः 1, 2 और 3 तीनों पूर्वधारणाएँ वैध हैं।', NULL),
    ('csat-2020-q45', 45, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Democracy, Minority Rights & Constitution', 'लोकतंत्र, अल्पसंख्यक अधिकार एवं संविधान पर निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Constitutionalism', 'Democracy']::TEXT[], 'Which of the following is/are the most rational and logical inference/inferences that can be made from the passage?
1. It is essential to rethink and redefine the economic role of the State in the quest for development.
2. India has not made effective implementation of its policies in social sectors nor made sufficient investments in them.
Select the correct answer using the code given below.', 'इस परिच्छेद से निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत और तार्किक निष्कर्ष निकाला/निकाले जा सकता/सकते है/हैं?
1. विकास की तलाश में यह अनिवार्य है कि राज्य की आर्थिक भूमिका पर पुनर्विचार किया जाए एवं उसे पुनर्परिभाषित किया जाए।
2. भारत ने अपने सामाजिक क्षेत्रों में न तो नीतियों का प्रभावी निष्पादन किया और न ही उनमें पर्याप्त निवेश किया।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'C', 'Correct Answer: Option C (Both 1 and 2).

1. Why Inference 1 is correct: The passage argues that economic liberalization was designed around government fiscal problems rather than people''s priorities, resulting in persistent poverty, inequality, and sectoral crises. Resolving these challenges to achieve meaningful development necessitates rethinking the economic role of the State.
2. Why Inference 2 is correct: The passage points out ongoing "quiet crises" in education, agriculture, and employment, alongside persistent poverty and rising inequality, directly inferring that social sector policies have suffered from underinvestment and ineffective implementation.

Therefore, both 1 and 2 are rational and logical inferences.', 'सही उत्तर: विकल्प C (1 और 2 दोनों)।

1. निष्कर्ष 1 क्यों सही है: परिच्छेद बताता है कि आर्थिक उदारीकरण जनता की प्राथमिकताओं या दीर्घकालीन विकास के बजाय सरकार की तात्कालिक समस्याओं से प्रेरित था, जिससे रोज़गार-विहीन वृद्धि और असमानता बढ़ी। सार्थक विकास के लिए राज्य की आर्थिक भूमिका पर पुनर्विचार और पुनर्परिभाषा आवश्यक है।
2. निष्कर्ष 2 क्यों सही है: शिक्षा, कृषि और रोज़गार में लगातार बने हुए संकट और सतत गरीबी यह स्पष्ट निष्कर्ष देते हैं कि सामाजिक क्षेत्रों में नीतियों का न तो प्रभावी क्रियान्वयन हुआ और न ही पर्याप्त निवेश किया गया।

अतः 1 और 2 दोनों सर्वाधिक तर्कसंगत निष्कर्ष हैं।', NULL),
    ('csat-2020-q46', 46, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Fundamental Rights vs Majority Rule', 'मूल अधिकार बनाम बहुमत शासन संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Majority Rule', 'Fundamental Rights']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. India''s economy needs to be greatly integrated with global economy so as to create large number of jobs and to sustain its growth momentum.
2. Economic liberalization would cause large economic growth which would reduce poverty and create sufficient employment in the long run.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. भारत की अर्थव्यवस्था को वैश्विक अर्थव्यवस्था से अत्यधिक समेकित करने की आवश्यकता है ताकि रोज़गार का बड़ी संख्या में सृजन किया जा सके तथा इसके वृद्धि संवेग को बनाए रखा जा सके।
2. आर्थिक उदारीकरण से बृहत् आर्थिक वृद्धि होगी जिससे दीर्घकाल में गरीबी घटेगी और रोज़गार का पर्याप्त सृजन होगा।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'D', 'Correct Answer: Option D (Neither 1 nor 2).

1. Why Assumption 1 is invalid: The passage does not assume that deeper integration with the global economy is the solution to domestic employment generation; rather, it critiques the flawed design of past liberal reforms.
2. Why Assumption 2 is invalid: The passage explicitly observes that liberalization has led to "jobless growth, persistent poverty and rising inequality," contradicting the assumption that market liberalization will automatically eliminate poverty and create sufficient employment in the long run.

Therefore, neither assumption 1 nor 2 is valid.', 'सही उत्तर: विकल्प D (न तो 1, न ही 2)।

1. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद वैश्विक अर्थव्यवस्था के साथ अधिक एकीकरण को रोज़गार सृजन का समाधान नहीं मानता, बल्कि उदारीकरण की आंतरिक संरचनात्मक कमियों की आलोचना करता है।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद स्पष्ट कहता है कि उदारीकरण से ''रोज़गार-विहीन वृद्धि'' और ''सतत गरीबी'' उत्पन्न हुई है, अतः यह मानना कि उदारीकरण दीर्घकाल में स्वतः गरीबी घटाकर पर्याप्त रोज़गार दे देगा, परिच्छेद के मूल विचार के विपरीत है।

अतः न तो 1 और न ही 2 वैध पूर्वधारणा है।', NULL),
    ('csat-2020-q47', 47, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Successive Percentage Discounts Comparison', 'क्रमिक प्रतिशत छूटों की तुलना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Discounts', 'Commercial Math']::TEXT[], 'A shop owner offers the following discount options on an article to a customer:
1. Successive discounts of 10% and 20%, and then pay a service tax of 10%
2. Successive discounts of 20% and 10%, and then pay a service tax of 10%
3. Pay a service tax of 10% first, then successive discounts of 20% and 10%
Which one of the following is correct?', 'एक वस्तु पर, एक दुकानदार, एक ग्राहक को निम्न छूट के विकल्प देता है :
1. 10% और 20% की क्रमिक छूट और तदुपरांत 10% सेवा कर का भुगतान
2. 20% और 10% की क्रमिक छूट और तदुपरांत 10% सेवा कर का भुगतान
3. पहले 10% सेवा कर का भुगतान तदुपरांत 20% और 10% की क्रमिक छूट
निम्नलिखित में से कौन-सा सही है?', '1 only is the best option for the customer.', '2 only is the best option for the customer.', '3 only is the best option for the customer.', 'All the options are equally good for the customer.', 'ग्राहक के लिए केवल 1 सबसे अच्छा विकल्प है।', 'ग्राहक के लिए केवल 2 सबसे अच्छा विकल्प है।', 'ग्राहक के लिए केवल 3 सबसे अच्छा विकल्प है।', 'ग्राहक के लिए सभी विकल्प समान रूप से अच्छे हैं।', 'D', 'Correct Answer: Option D (All the options are equally good for the customer).

1. Let the original price of the article be $P$.
2. Calculate the final price for each option:
   * **Option 1**: $P \times (1 - 0.10) \times (1 - 0.20) \times (1 + 0.10) = P \times 0.9 \times 0.8 \times 1.1 = 0.792 P$
   * **Option 2**: $P \times (1 - 0.20) \times (1 - 0.10) \times (1 + 0.10) = P \times 0.8 \times 0.9 \times 1.1 = 0.792 P$
   * **Option 3**: $P \times (1 + 0.10) \times (1 - 0.20) \times (1 - 0.10) = P \times 1.1 \times 0.8 \times 0.9 = 0.792 P$
3. Because multiplication is commutative, the final effective price is identical ($0.792 P$) in all three cases.

Therefore, all the options are equally good for the customer.', 'सही उत्तर: विकल्प D (ग्राहक के लिए सभी विकल्प समान रूप से अच्छे हैं)।

1. माना कि वस्तु का प्रारंभिक मूल्य $P$ है।
2. प्रत्येक विकल्प के अंतिम मूल्य की गणना करने पर:
   * **विकल्प 1**: $P \times 0.9 \times 0.8 \times 1.1 = 0.792 P$
   * **विकल्प 2**: $P \times 0.8 \times 0.9 \times 1.1 = 0.792 P$
   * **विकल्प 3**: $P \times 1.1 \times 0.8 \times 0.9 = 0.792 P$
3. चूँकि गुणनफल क्रमविनिमेय होता है, अतः तीनों विकल्पों में ग्राहक को देय अंतिम राशि बिल्कुल समान ($0.792 P$) होगी।

अतः ग्राहक के लिए सभी विकल्प समान रूप से अच्छे हैं।', NULL),
    ('csat-2020-q48', 48, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Alphabet Alphabetical Positional Values & Arithmetic Coding', 'वर्णमाला स्थितीय मान एवं अंकगणितीय कोडिंग', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Coding-Decoding', 'Letter Positions']::TEXT[], 'The letters from A to Z are numbered from 1 to 26 respectively. If GHI = 1578 and DEF = 912, then what is ABC equal to?', 'A से Z तक के वर्ण 1 से 26 तक क्रमशः क्रमांकित किए गए हैं। यदि GHI = 1578 और DEF = 912 हों, तो ABC किसके बराबर है?', '492', '468', '262', '246', '492', '468', '262', '246', 'D', 'Correct Answer: Option D (246).

1. Replace the letters with their respective positional alphabetical numbers concatenated into a single integer, and observe the relationship:
   * $GHI \rightarrow G=7, H=8, I=9 \implies 789$. Note that $789 \times 2 = 1578$.
   * $DEF \rightarrow D=4, E=5, F=6 \implies 456$. Note that $456 \times 2 = 912$.
2. Apply the same rule to $ABC$:
   * $ABC \rightarrow A=1, B=2, C=3 \implies 123$.
   * Value $= 123 \times 2 = 246$.

Therefore, ABC is equal to 246.', 'सही उत्तर: विकल्प D (246)।

1. वर्णों के वर्णमाला क्रमांकों को मिलाकर बनने वाली संख्या और दिए गए मान के संबंध को देखने पर:
   * $GHI \rightarrow G=7, H=8, I=9 \implies 789$ और $789 \times 2 = 1578$
   * $DEF \rightarrow D=4, E=5, F=6 \implies 456$ और $456 \times 2 = 912$
2. इसी प्रकार $ABC$ के लिए:
   * $ABC \rightarrow A=1, B=2, C=3 \implies 123$
   * मान $= 123 \times 2 = 246$

अतः ABC का मान 246 के बराबर है।', NULL),
    ('csat-2020-q49', 49, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Letter Cluster Analogy & Alphabet Shift Patterns', 'अक्षर समूह सादृश्यता एवं वर्णमाला विस्थापन पैटर्न', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Analogy', 'Letter Shifts']::TEXT[], 'What is the missing term @ in the following?
$$\text{ACPQ : BESU :: MNGI : @}$$', 'निम्न में लुप्त पद @ क्या है?
$$\text{ACPQ : BESU :: MNGI : @}$$', 'NPJL', 'NOJM', 'NPIL', 'NPJM', 'NPJL', 'NOJM', 'NPIL', 'NPJM', 'D', 'Correct Answer: Option D (NPJM).

1. Analyze the letter shift pattern between $\text{ACPQ}$ and $\text{BESU}$:
   * $A (1) + 1 = B (2)$
   * $C (3) + 2 = E (5)$
   * $P (16) + 3 = S (19)$
   * $Q (17) + 4 = U (21)$
   The shift pattern across the positions is $+1, +2, +3, +4$.
2. Apply the same shift rule to $\text{MNGI}$:
   * $M (13) + 1 = N (14)$
   * $N (14) + 2 = P (16)$
   * $G (7) + 3 = J (10)$
   * $I (9) + 4 = M (13)$

Therefore, the missing term is NPJM.', 'सही उत्तर: विकल्प D (NPJM)।

1. $\text{ACPQ}$ और $\text{BESU}$ के बीच वर्णों के विस्थापन का प्रतिरूप:
   * $A (1) + 1 = B (2)$
   * $C (3) + 2 = E (5)$
   * $P (16) + 3 = S (19)$
   * $Q (17) + 4 = U (21)$
   यहाँ विस्थापन का नियम क्रमशः $+1, +2, +3, +4$ है।
2. इसी नियम को $\text{MNGI}$ पर लागू करने पर:
   * $M (13) + 1 = N (14)$
   * $N (14) + 2 = P (16)$
   * $G (7) + 3 = J (10)$
   * $I (9) + 4 = M (13)$

अतः लुप्त पद NPJM है।', NULL),
    ('csat-2020-q50', 50, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Laws of Exponents, Negative Indices & Magnitude Comparison', 'घातांक नियम, ऋणात्मक घातें एवं परिमाण तुलना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Exponents & Powers', 'Number Comparison']::TEXT[], 'What is the largest number among the following?
(a) $(1/2)^{-6}$
(b) $(1/4)^{-3}$
(c) $(1/3)^{-4}$
(d) $(1/6)^{-2}$', 'निम्न में कौन-सी सबसे बड़ी संख्या है?
(a) $(1/2)^{-6}$
(b) $(1/4)^{-3}$
(c) $(1/3)^{-4}$
(d) $(1/6)^{-2}$', '(1/2)^-6', '(1/4)^-3', '(1/3)^-4', '(1/6)^-2', '(1/2)^-6', '(1/4)^-3', '(1/3)^-4', '(1/6)^-2', 'C', 'Correct Answer: Option C ($(1/3)^{-4}$).

1. Evaluate the numerical value of each option using the rule of negative exponents $(1/a)^{-b} = a^b$:
   * Option A: $\left(\frac{1}{2}\right)^{-6} = 2^6 = 64$
   * Option B: $\left(\frac{1}{4}\right)^{-3} = 4^3 = 64$
   * Option C: $\left(\frac{1}{3}\right)^{-4} = 3^4 = 81$
   * Option D: $\left(\frac{1}{6}\right)^{-2} = 6^2 = 36$
2. Comparing the evaluated values: $81 > 64 = 64 > 36$.

Therefore, $(1/3)^{-4}$ is the largest number.', 'सही उत्तर: विकल्प C ($(1/3)^{-4}$)।

1. घातांक के नियम $(1/a)^{-b} = a^b$ का प्रयोग करके प्रत्येक विकल्प का मान ज्ञात करने पर:
   * विकल्प A: $\left(\frac{1}{2}\right)^{-6} = 2^6 = 64$
   * विकल्प B: $\left(\frac{1}{4}\right)^{-3} = 4^3 = 64$
   * विकल्प C: $\left(\frac{1}{3}\right)^{-4} = 3^4 = 81$
   * विकल्प D: $\left(\frac{1}{6}\right)^{-2} = 6^2 = 36$
2. मानों की तुलना करने पर: $81 > 64 = 64 > 36$।

अतः सबसे बड़ी संख्या $(1/3)^{-4}$ है।', NULL),
    ('csat-2020-q51', 51, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'HCF of Mixed Fractions & Unit Conversion in Lengths', 'मिश्रित भिन्नों का महत्तम समापवर्तक (HCF) एवं लंबाई इकाई रूपांतरण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'HCF of Fractions', 'Mensuration Units']::TEXT[], 'What is the greatest length x such that $3\frac{1}{2}\text{ m}$ and $8\frac{3}{4}\text{ m}$ are integral multiples of x?', 'अधिकतम लम्बाई x क्या होगी, जिससे कि $3\frac{1}{2}\text{ m}$ और $8\frac{3}{4}\text{ m}$, x के पूर्णांक गुणज हों?', '1 1/2 m', '1 1/3 m', '1 1/4 m', '1 3/4 m', '1 1/2 m', '1 1/3 m', '1 1/4 m', '1 3/4 m', 'D', 'Correct Answer: Option D ($1\frac{3}{4}\text{ m}$).

1. If both lengths are integral multiples of $x$, then $x$ must be the Highest Common Factor (HCF) of the two lengths.
2. Convert the mixed fractions to improper fractions:
   $$3\frac{1}{2} = \frac{7}{2} = \frac{14}{4}\text{ m}, \quad 8\frac{3}{4} = \frac{35}{4}\text{ m}$$
3. Calculate the HCF of fractions:
   $$\text{HCF}\left(\frac{14}{4}, \frac{35}{4}\right) = \frac{\text{HCF}(14, 35)}{\text{LCM}(4, 4)} = \frac{7}{4} = 1\frac{3}{4}\text{ m}$$

Therefore, the greatest length x is $1\frac{3}{4}\text{ m}$.', 'सही उत्तर: विकल्प D ($1\frac{3}{4}\text{ m}$)।

1. यदि दोनों लम्बाइयाँ $x$ के पूर्णांक गुणज हैं, तो $x$ दोनों लम्बाइयों का महत्तम समापवर्तक (HCF) होगा।
2. मिश्र भिन्न को विषम भिन्न में बदलने पर:
   $$3\frac{1}{2} = \frac{7}{2} = \frac{14}{4}\text{ m}, \quad 8\frac{3}{4} = \frac{35}{4}\text{ m}$$
3. भिन्नों का HCF ज्ञात करने पर:
   $$\text{HCF}\left(\frac{14}{4}, \frac{35}{4}\right) = \frac{\text{HCF}(14, 35)}{\text{LCM}(4, 4)} = \frac{7}{4} = 1\frac{3}{4}\text{ m}$$

अतः अधिकतम लम्बाई $x = 1\frac{3}{4}\text{ m}$ होगी।', NULL),
    ('csat-2020-q52', 52, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Demographic Table Data Interpretation (Natural Growth Rate)', 'जनसांख्यिकीय तालिका आँकड़ा व्याख्या (प्राकृतिक संवृद्धि दर)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Data Interpretation', 'Tables', 'Demographics']::TEXT[], 'Consider the following data:
* 1911-1921: Birthrate = 48.1, Death rate = 35.5
* 1921-1931: Birthrate = 46.4, Death rate = 36.3
* 1931-1941: Birthrate = 45.2, Death rate = 31.2
* 1941-1951: Birthrate = 39.9, Death rate = 27.4
* 1951-1961: Birthrate = 41.7, Death rate = 22.8
* 1961-1971: Birthrate = 41.1, Death rate = 18.9
* 1971-1981: Birthrate = 37.1, Death rate = 14.8
For which period was the natural growth rate maximum?', 'निम्न आँकड़ों पर विचार कीजिए :
* 1911-1921: जन्मदर = 48.1, मृत्यु दर = 35.5
* 1921-1931: जन्मदर = 46.4, मृत्यु दर = 36.3
* 1931-1941: जन्मदर = 45.2, मृत्यु दर = 31.2
* 1941-1951: जन्मदर = 39.9, मृत्यु दर = 27.4
* 1951-1961: जन्मदर = 41.7, मृत्यु दर = 22.8
* 1961-1971: जन्मदर = 41.1, मृत्यु दर = 18.9
* 1971-1981: जन्मदर = 37.1, मृत्यु दर = 14.8
किस समयावधि में प्राकृतिक विकास दर अधिकतम थी?', '1911-1921', '1941-1951', '1961-1971', '1971-1981', '1911-1921', '1941-1951', '1961-1971', '1971-1981', 'D', 'Correct Answer: Option D (1971-1981).

1. Natural growth rate is calculated as: $\text{Natural Growth Rate} = \text{Birthrate} - \text{Death rate}$.
2. Compute the rate for each period:
   * 1911-1921: $48.1 - 35.5 = 12.6$
   * 1921-1931: $46.4 - 36.3 = 10.1$
   * 1931-1941: $45.2 - 31.2 = 14.0$
   * 1941-1951: $39.9 - 27.4 = 12.5$
   * 1951-1961: $41.7 - 22.8 = 18.9$
   * 1961-1971: $41.1 - 18.9 = 22.2$
   * 1971-1981: $37.1 - 14.8 = 22.3$
3. Comparing the values, $22.3$ is the highest.

Therefore, the natural growth rate was maximum during 1971-1981.', 'सही उत्तर: विकल्प D (1971-1981)।

1. प्राकृतिक विकास दर की गणना का सूत्र: $\text{प्राकृतिक विकास दर} = \text{जन्मदर} - \text{मृत्यु दर}$।
2. प्रत्येक समयावधि के लिए गणना करने पर:
   * 1911-1921: $48.1 - 35.5 = 12.6$
   * 1921-1931: $46.4 - 36.3 = 10.1$
   * 1931-1941: $45.2 - 31.2 = 14.0$
   * 1941-1951: $39.9 - 27.4 = 12.5$
   * 1951-1961: $41.7 - 22.8 = 18.9$
   * 1961-1971: $41.1 - 18.9 = 22.2$
   * 1971-1981: $37.1 - 14.8 = 22.3$
3. सर्वाधिक मान 22.3 समयावधि 1971-1981 में प्राप्त होता है।

अतः प्राकृतिक विकास दर 1971-1981 में अधिकतम थी।', NULL),
    ('csat-2020-q53', 53, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Recurring Decimal Conversion to Rational Fractions', 'आवर्ती दशमलव का परिमेय भिन्न में रूपांतरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Recurring Decimals', 'Fractions']::TEXT[], 'The recurring decimal representation 1.272727... is equivalent to', 'आवर्त दशमलव निरूपण 1-272727... किसके समान है?', '13/11', '14/11', '127/99', '137/99', '13/11', '14/11', '127/99', '137/99', 'B', 'Correct Answer: Option B (14/11).

1. Let $x = 1.272727\dots = 1.\overline{27}$.
2. Multiply by 100:
   $$100x = 127.272727\dots$$
3. Subtract the first equation from the second:
   $$100x - x = 127.\overline{27} - 1.\overline{27}$$
   $$99x = 126$$
4. Simplify the fraction:
   $$x = \frac{126}{99} = \frac{126 \div 9}{99 \div 9} = \frac{14}{11}$$

Therefore, 1.272727... is equivalent to 14/11.', 'सही उत्तर: विकल्प B (14/11)।

1. माना कि $x = 1.272727\dots = 1.\overline{27}$ है।
2. समीकरण को 100 से गुणा करने पर:
   $$100x = 127.272727\dots$$
3. घटाने पर:
   $$100x - x = 127.\overline{27} - 1.\overline{27}$$
   $$99x = 126$$
4. भिन्न को सरल करने पर:
   $$x = \frac{126}{99} = \frac{14}{11}$$

अतः आवर्त दशमलव 1.272727... का मान 14/11 के समान है।', NULL),
    ('csat-2020-q54', 54, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'LCM & Constant Remainder Theorem for 4-Digit Integers', 'लघुत्तम समापवर्त्य (LCM) एवं 4-अंकीय संख्याओं के लिए शेषफल प्रमेय', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'LCM', 'Remainder Theorem']::TEXT[], 'What is the least four-digit number when divided by 3, 4, 5 and 6 leaves a remainder 2 in each case?', 'चार अंकों की सबसे छोटी संख्या कौन-सी है जिसे 3, 4, 5 और 6 से विभाजित करने पर प्रत्येक बार 2 शेष बचता है?', '1012', '1022', '1122', '1222', '1012', '1022', '1122', '1222', 'B', 'Correct Answer: Option B (1022).

1. Find the LCM of the divisors 3, 4, 5, and 6:
   $$\text{LCM}(3, 4, 5, 6) = 60$$
2. The general form of the required number is $N = 60k + 2$.
3. The smallest four-digit number is 1000. Dividing 1000 by 60:
   $$1000 \div 60 = 16 \text{ remainder } 40$$
4. The smallest multiple of 60 with 4 digits is $60 \times 17 = 1020$.
5. Adding the common remainder of 2:
   $$N = 1020 + 2 = 1022$$

Therefore, the least four-digit number is 1022.', 'सही उत्तर: विकल्प B (1022)।

1. भाजकों 3, 4, 5 और 6 का ल.स.प. (LCM) निकालने पर:
   $$\text{LCM}(3, 4, 5, 6) = 60$$
2. अभीष्ट संख्या का सामान्य रूप $N = 60k + 2$ होगा।
3. चार अंकों की सबसे छोटी संख्या 1000 है। $1000 \div 60 = 16$ (शेषफल 40)।
4. चार अंकों का 60 का सबसे छोटा गुणज $= 60 \times 17 = 1020$ है।
5. 2 शेषफल जोड़ने पर:
   $$N = 1020 + 2 = 1022$$

अतः चार अंकों की सबसे छोटी अभीष्ट संख्या 1022 है।', NULL),
    ('csat-2020-q55', 55, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Demographic Percentage & Marriage Proportion Equations', 'जनसंख्या प्रतिशत एवं वैवाहिक अनुपात समीकरण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Percentages', 'Ratio & Proportion']::TEXT[], 'In adult population of a city, 40% men and 30% women are married. What is the percentage of married adult population if no man marries more than one woman and no woman marries more than one man; and there are no widows and widowers?', 'एक शहर की वयस्क समष्टि में 40% पुरुष और 30% महिलाएँ विवाहित हैं। विवाहित वयस्क समष्टि का प्रतिशत क्या है, यदि कोई भी पुरुष एक से अधिक महिला से विवाह नहीं करता है और कोई भी महिला एक से अधिक पुरुष से विवाह नहीं करती है; और इनमें कोई विधवा और विधुर नहीं है?', '33 1/7%', '34%', '34 2/7%', '35%', '33 1/7%', '34%', '34 2/7%', '35%', 'C', 'Correct Answer: Option C ($34\frac{2}{7}\%$).

1. Let the total adult male population be $M$ and the adult female population be $W$.
2. Since each married man has exactly one wife:
   $$0.40 M = 0.30 W \implies \frac{M}{W} = \frac{3}{4}$$
3. Assume $M = 300$ and $W = 400$. Total adult population $= 300 + 400 = 700$.
4. Number of married men $= 0.40 \times 300 = 120$.
   Number of married women $= 0.30 \times 400 = 120$.
   Total married adults $= 120 + 120 = 240$.
5. Percentage of married adult population:
   $$\frac{240}{700} \times 100\% = \frac{240}{7}\% = 34\frac{2}{7}\%$$

Therefore, the percentage of married adult population is $34\frac{2}{7}\%$.', 'सही उत्तर: विकल्प C ($34\frac{2}{7}\%$)।

1. माना वयस्क पुरुषों की संख्या $M$ तथा वयस्क महिलाओं की संख्या $W$ है।
2. चूँकि विवाहित पुरुषों और महिलाओं की संख्या समान होगी:
   $$0.40 M = 0.30 W \implies \frac{M}{W} = \frac{3}{4}$$
3. माना $M = 300$ और $W = 400$, अतः कुल वयस्क समष्टि $= 300 + 400 = 700$।
4. विवाहित पुरुष $= 0.40 \times 300 = 120$ तथा विवाहित महिलाएँ $= 120$।
   कुल विवाहित वयस्क $= 120 + 120 = 240$।
5. विवाहित वयस्क समष्टि का प्रतिशत:
   $$\frac{240}{700} \times 100\% = \frac{240}{7}\% = 34\frac{2}{7}\%$$

अतः विवाहित वयस्क समष्टि का प्रतिशत $34\frac{2}{7}\%$ है।', NULL),
    ('csat-2020-q56', 56, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Modular Arithmetic, Factor Cancellation & Remainder in Large Products', 'मॉड्यूलर अंकगणित, गुणनखंड निरसन एवं वृहद् गुणनफल शेषफल', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Remainders', 'Modular Arithmetic']::TEXT[], 'What is the remainder when $51 \times 27 \times 35 \times 62 \times 75$ is divided by 100?', 'जब $51\times27\times35\times62\times75$ को 100 से विभाजित किया जाता है, तो शेषफल क्या है?', '50', '25', '5', '1', '50', '25', '5', '1', 'A', 'Correct Answer: Option A (50).

1. Let $N = 51 \times 27 \times 35 \times 62 \times 75$.
2. Factorize components containing 2 and 5:
   * $35 = 5 \times 7$
   * $62 = 2 \times 31$
   * $75 = 25 \times 3 = 5^2 \times 3$
3. Note that $N$ contains $2^1$ (from 62) and $5^3$ (from $35 \times 75$).
   $$N = 2 \times 25 \times (51 \times 27 \times 7 \times 31 \times 3 \times 5) = 50 \times (\text{an odd integer } k)$$
4. Any odd multiple of 50 (i.e., $50 \times 1, 50 \times 3, 50 \times 5, \dots$) ends in 50, which leaves remainder 50 when divided by 100.

Therefore, the remainder is 50.', 'सही उत्तर: विकल्प A (50)।

1. गुणनफल $N = 51 \times 27 \times 35 \times 62 \times 75$।
2. 2 और 5 के गुणनखंडों को अलग करने पर:
   * $35 = 5 \times 7$
   * $62 = 2 \times 31$
   * $75 = 25 \times 3$
3. $N = (2 \times 25) \times (51 \times 27 \times 7 \times 31 \times 15) = 50 \times (\text{एक विषम पूर्णांक})$।
4. 50 का कोई भी विषम गुणज (जैसे 50, 150, 250, ...) 100 से विभाजित करने पर सदैव 50 शेषफल देता है।

अतः 100 से विभाजित करने पर शेषफल 50 प्राप्त होगा।', NULL),
    ('csat-2020-q57', 57, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Fractional Ratio Simplification & Monetary Distribution', 'भिन्न अनुपातों का सरलीकरण एवं धनराशि वितरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Ratio & Proportion', 'Division of Amounts']::TEXT[], 'A sum of ₹2,500 is distributed among X, Y and Z in the ratio $\frac{1}{2} : \frac{3}{4} : \frac{5}{6}$. What is the difference between the maximum share and the minimum share?', '₹2,500 की एक धनराशि को X, Y और Z में $\frac{1}{2}:\frac{3}{4}:\frac{5}{6}$ के अनुपात में वितरित किया जाता है। अधिकतम अंश और न्यूनतम अंश के बीच अंतर क्या है?', '300', '350', '400', '450', '300', '350', '400', '450', 'C', 'Correct Answer: Option C (400).

1. Convert the fractional ratio into whole numbers by multiplying by the LCM of denominators $\text{LCM}(2, 4, 6) = 12$:
   $$X : Y : Z = \left(\frac{1}{2} \times 12\right) : \left(\frac{3}{4} \times 12\right) : \left(\frac{5}{6} \times 12\right) = 6 : 9 : 10$$
2. Total parts $= 6 + 9 + 10 = 25$ parts.
3. Value of each part $= \frac{2500}{25} = 100$.
4. Maximum share is Z ($10 \times 100 = 1000$) and minimum share is X ($6 \times 100 = 600$).
5. Difference $= 1000 - 600 = 400$.

Therefore, the difference between the maximum and minimum share is 400.', 'सही उत्तर: विकल्प C (400)।

1. भिन्नात्मक अनुपात को सरल पूर्णांक अनुपात में बदलने के लिए हरों के ल.स.प. (12) से गुणा करने पर:
   $$X : Y : Z = \left(\frac{1}{2} \times 12\right) : \left(\frac{3}{4} \times 12\right) : \left(\frac{5}{6} \times 12\right) = 6 : 9 : 10$$
2. कुल अनुपाती भाग $= 6 + 9 + 10 = 25$ भाग।
3. 1 भाग का मान $= \frac{2500}{25} = 100$ रुपये।
4. अधिकतम अंश Z ($10 \times 100 = 1000$) तथा न्यूनतम अंश X ($6 \times 100 = 600$) है।
5. दोनों का अंतर $= 1000 - 600 = 400$ रुपये।

अतः अधिकतम और न्यूनतम अंश के बीच का अंतर 400 है।', NULL),
    ('csat-2020-q58', 58, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Sum of Powers of Ten Expressions (10^n + 1)', 'दस की घात व्यंजकों (10^n + 1) के अंकों का योग', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Powers of 10', 'Sum of Digits']::TEXT[], 'For what value of n, the sum of digits in the number $(10^n + 1)$ is 2?', 'n के किस मान के लिए संख्या $(10^n+1)$ में अंकों का योग 2 है?', 'For n = 0 only', 'For any whole number n', 'For any positive integer n only', 'For any real number n', 'केवल n = 0 के लिए', 'किसी पूर्ण संख्या n के लिए', 'केवल किसी धनात्मक पूर्णांक n के लिए', 'किसी वास्तविक संख्या n के लिए', 'B', 'Correct Answer: Option B (For any whole number n).

1. Test whole numbers $n \in \{0, 1, 2, 3, \dots\}$:
   * For $n = 0$: $10^0 + 1 = 1 + 1 = 2$. Sum of digits = 2.
   * For $n = 1$: $10^1 + 1 = 11$. Sum of digits = $1 + 1 = 2$.
   * For $n = 2$: $10^2 + 1 = 101$. Sum of digits = $1 + 0 + 1 = 2$.
   * For any general whole number $n \ge 1$, $10^n + 1 = 100\dots01$ (one 1 at the beginning, one 1 at the end, and $(n-1)$ zeroes). The sum of the digits is always $1 + 0 + \dots + 0 + 1 = 2$.

Therefore, the sum of digits is 2 for any whole number n.', 'सही उत्तर: विकल्प B (किसी पूर्ण संख्या n के लिए)।

1. पूर्ण संख्याओं ($n = 0, 1, 2, 3, \dots$) के लिए जाँच करने पर:
   * $n = 0$ के लिए: $10^0 + 1 = 1 + 1 = 2$ (अंकों का योग = 2)
   * $n = 1$ के लिए: $10^1 + 1 = 11$ (अंकों का योग = $1 + 1 = 2$)
   * $n = 2$ के लिए: $10^2 + 1 = 101$ (अंकों का योग = $1 + 0 + 1 = 2$)
   * किसी भी पूर्ण संख्या $n \ge 1$ के लिए, संख्या का स्वरूप $100\dots01$ होता है जिसमें केवल दो ''1'' और मध्य में शून्य होते हैं, अतः अंकों का योग सदैव $1 + 1 = 2$ रहता है।

अतः यह किसी भी पूर्ण संख्या n के लिए सत्य है।', NULL),
    ('csat-2020-q59', 59, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Group Averages & Inter-Group Transfer Invariance', 'समूह औसत एवं अंतर-समूह स्थानांतरण अपरिवर्तनीयता', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Class Distribution']::TEXT[], 'In a class, there are three groups A, B and C. If one student from group A and two students from group B are shifted to group C, then what happens to the average weight of the students of the class?', 'एक कक्षा में तीन समूह A, B और C हैं। यदि समूह A से एक विद्यार्थी और समूह B से दो विद्यार्थियों को समूह C में स्थानांतरित किया जाता है, तो कक्षा के विद्यार्थियों के औसत भार का क्या होगा?', 'It increases.', 'It decreases.', 'It remains the same.', 'No conclusion can be drawn due to insufficient data.', 'यह बढ़ जाएगा।', 'यह घट जाएगा।', 'यह वही रहेगा।', 'अपर्याप्त आँकड़ों के कारण कोई निष्कर्ष नहीं निकाला जा सकता है।', 'C', 'Correct Answer: Option C (It remains the same).

1. The overall average weight of the students of the entire class is defined as:
   $$\text{Class Average Weight} = \frac{\text{Total weight of all students in the class}}{\text{Total number of students in the class}}$$
2. Shifting students between groups (A, B, and C) within the same class merely rearranges students internally.
3. The total weight of the entire class and the total number of students in the class both remain completely unchanged.

Therefore, the average weight of the students of the class remains the same.', 'सही उत्तर: विकल्प C (यह वही रहेगा)।

1. पूरी कक्षा के विद्यार्थियों के औसत भार का सूत्र:
   $$\text{कक्षा का औसत भार} = \frac{\text{कक्षा के सभी विद्यार्थियों का कुल भार}}{\text{कक्षा के विद्यार्थियों की कुल संख्या}}$$
2. कक्षा के भीतर ही विद्यार्थियों को एक समूह से दूसरे समूह में स्थानांतरित करने से कक्षा के कुल भार और विद्यार्थियों की कुल संख्या में कोई परिवर्तन नहीं होता।

अतः कक्षा के विद्यार्थियों का औसत भार वही रहेगा।', NULL),
    ('csat-2020-q60', 60, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Combinatorial Sums & Currency Denomination Counting', 'क्रमचय-संचय योग एवं मुद्रा मूल्यवर्ग गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Permutation & Combination', 'Combinatorics', 'Distinct Sums']::TEXT[], 'How many different sums can be formed with the denominations ₹50, ₹100, ₹200, ₹500 and ₹2,000 taking at least three denominations at a time?', 'मूल्यवर्गों ₹50, ₹100, ₹200, ₹500 और ₹2,000 के साथ, एक समय में कम-से-कम तीन मूल्यवर्गों को लेते हुए, कितनी विभिन्न धनराशियाँ बनाई जा सकती हैं?', '16', '15', '14', '10', '16', '15', '14', '10', 'A', 'Correct Answer: Option A (16).

1. We are given $n = 5$ distinct denominations: $\{50, 100, 200, 500, 2000\}$.
2. We must select subsets of sizes 3, 4, or 5 (at least 3 at a time):
   * Number of ways to choose 3 denominations = $\binom{5}{3} = 10$
   * Number of ways to choose 4 denominations = $\binom{5}{4} = 5$
   * Number of ways to choose 5 denominations = $\binom{5}{5} = 1$
3. Total number of subsets = $10 + 5 + 1 = 16$.
4. Because all individual denomination amounts are widely distinct, every combination produces a unique sum.

Therefore, 16 different sums can be formed.', 'सही उत्तर: विकल्प A (16)।

1. दिए गए कुल $n = 5$ भिन्न मूल्यवर्ग हैं: $\{50, 100, 200, 500, 2000\}$।
2. एक समय में कम-से-कम 3 मूल्यवर्गों को चुनने के तरीके:
   * 3 मूल्यवर्गों को चुनना $= \binom{5}{3} = 10$
   * 4 मूल्यवर्गों को चुनना $= \binom{5}{4} = 5$
   * 5 मूल्यवर्गों को चुनना $= \binom{5}{5} = 1$
3. कुल संभव संचय $= 10 + 5 + 1 = 16$।
4. चूँकि प्रत्येक संयोजन से बनने वाली धनराशि अद्वितीय (भिन्न) है, अतः कुल 16 विभिन्न धनराशियाँ बनाई जा सकती हैं।

अतः 16 सही उत्तर है।', NULL),
    ('csat-2020-q61', 61, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Passage Inference on Banking System Non-Performing Assets (NPAs)', 'बैंकिंग प्रणाली में गैर-निष्पादित परिसंपत्तियों (NPA) पर निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Banking Sector', 'Financial Stability']::TEXT[], 'Which one of the following is the most logical and rational inference that can be made from the above passage?', 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?', 'Indian banking system is not able to help the country in its economic growth.', 'Economic reforms that started in 1991 have not helped in improving the economy to expected levels.', 'India lacks the institutional mechanism to deal with the failure of banks.', 'Encouraging the foreign investments in our industrial sector is a good alternative to this sector''s dependence on banks for credit.', 'भारतीय बैंकिंग व्यवस्था देश की आर्थिक विकास में मदद नहीं कर पा रही है।', '1991 में प्रारंभ किए गए आर्थिक सुधारों ने अर्थव्यवस्था के अपेक्षित स्तर तक सुधार में सहायता नहीं की है।', 'भारत में बैंकों की असफलता से निपटने के लिए संस्थागत प्रक्रिया नहीं है।', 'औद्योगिक सेक्टर में विदेशी निवेश को प्रोत्साहन देना उस सेक्टर के बैंक ऋण के ऊपर निर्भरता का एक अच्छा विकल्प है।', 'C', 'Correct Answer: Option C (India lacks the institutional mechanism to deal with the failure of banks).

1. Why Option C is correct: The passage explicitly states that an institutional resolution corporation should have been established post-1991 reforms to resolve failing banks, and laments that "today, we cannot shut down banks because there is no proper system to shut them down."
2. Why Option A is incorrect: The passage discusses a shrinking of industrial credit due to legacy issues, but does not claim the banking system as a whole is incapable of supporting growth.
3. Why Option B is incorrect: The passage critiques specific incomplete institutional reforms concerning bank resolution, rather than dismissing the entirety of 1991 economic reforms.
4. Why Option D is incorrect: Substituting bank credit with foreign direct investment is an extraneous policy topic not mentioned in the text.

Therefore, option C is the most logical and rational inference.', 'सही उत्तर: विकल्प C (भारत में बैंकों की असफलता से निपटने के लिए संस्थागत प्रक्रिया नहीं है)।

1. विकल्प C क्यों सही है: परिच्छेद स्पष्ट रूप से कहता है कि 1991 के सुधारों के बाद बैंकों के लिए समाधान निगम (resolution corporation) जैसी संस्थागत व्यवस्था होनी चाहिए थी, किन्तु "आज हम बैंकों को बंद नहीं कर सकते क्योंकि उन्हें बंद करने की कोई उचित व्यवस्था नहीं है।"
2. विकल्प A क्यों गलत है: परिच्छेद औद्योगिक ऋण में संकुचन और बैंकिंग सुधारों की बात करता है, यह पूरी व्यवस्था को आर्थिक विकास में असमर्थ घोषित नहीं करता।
3. विकल्प B क्यों गलत है: परिच्छेद 1991 के सुधारों के अधूरे संस्थागत पहलुओं की ओर संकेत करता है, यह पूरे सुधारों को निष्फल नहीं बताता।
4. विकल्प D क्यों गलत है: औद्योगिक क्षेत्र के लिए विदेशी निवेश को विकल्प बनाने की परिच्छेद में कोई चर्चा नहीं है।

अतः विकल्प C सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष है।', NULL),
    ('csat-2020-q62', 62, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Air Pollution Dynamics & Meteorological Trapping', 'वायु प्रदूषण गतिशीलता एवं मौसम संबंधी अवरोध पर निष्कर्ष', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Air Pollution', 'Atmospheric Science']::TEXT[], 'Which one of the following is the most logical and rational inference that can be made from the above passage?', 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?', 'India''s commitment to reduce emissions by 33% is unlikely to be achieved.', 'India should import gas rather than invest in renewable resources.', 'Getting renewable resources to market too soon may be costly.', 'India should put in more efforts in the exploration of natural gas.', 'उत्सर्जन को 33% घटाने की भारत की प्रतिबद्धता को प्राप्त करना असम्भाव्य है।', 'भारत को नवीकरणीय संसाधनों में निवेश करने के बजाय गैस का आयात करना चाहिए।', 'नवीकरणीय संसाधनों को बहुत जल्दी बाजार में लाना महँगा हो सकता है।', 'भारत को प्राकृतिक गैस की खोज में अधिक प्रयत्न करना चाहिए।', 'C', 'Correct Answer: Option C (Getting renewable resources to market too soon may be costly).

1. Why Option C is correct: The passage notes that certain renewable technologies are still navigating their "cost curves and learning curves" and that businesses are wary of investing heavily while the technology is not yet mature, implying that premature large-scale commercialization can be economically costly.
2. Why Option A is incorrect: The passage states that the Indian Government is strongly committed to its 2030 emission reduction targets; it does not conclude that the target is unachievable.
3. Why Option B is incorrect: The passage mentions pushing towards a gas-based economy as an interim measure, not abandoning renewable investment in favor of gas imports.
4. Why Option D is incorrect: Domestic exploration of natural gas is not suggested or discussed in the passage.

Therefore, option C is the most logical inference.', 'सही उत्तर: विकल्प C (नवीकरणीय संसाधनों को बहुत जल्दी बाजार में लाना महँगा हो सकता है)।

1. विकल्प C क्यों सही है: परिच्छेद बताता है कि कई नवीकरणीय संसाधन अभी अपनी ''लागत वक्रों एवं प्रवीणता वक्रों'' (learning curves) से गुजर रहे हैं और तकनीक परिपक्व न होने के कारण कंपनियाँ भारी निवेश से हिचकिचा रही हैं, जिसका अर्थ है कि इन्हें समय से पहले बाज़ार में लाना महँगा हो सकता है।
2. विकल्प A क्यों गलत है: परिच्छेद सरकार की मजबूत प्रतिबद्धता को दर्शाता है, यह लक्ष्य प्राप्ति को असंभव नहीं बताता।
3. विकल्प B क्यों गलत है: परिच्छेद गैस-आधारित अर्थव्यवस्था को प्रोत्साहन की बात करता है, किन्तु नवीकरणीय संसाधनों में निवेश छोड़कर गैस आयात का सुझाव नहीं देता।
4. विकल्प D क्यों गलत है: प्राकृतिक गैस की खोज में अधिक प्रयास करने का विचार परिच्छेद में नहीं है।

अतः विकल्प C सर्वाधिक तार्किक निष्कर्ष है।', NULL),
    ('csat-2020-q63', 63, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Biomass Burning, Automation & Agricultural Subsidies', 'बायोमास दहन, स्वचालन एवं कृषि सब्सिडी संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Stubble Burning', 'Critical Assumptions']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Governments often provide inefficient and costly subsidies for technologies that may not be ready in the near future.
2. India''s commitment of reducing emissions by 33% by 2030 shall be on the basis of gas-based economy.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. सरकार प्रायः ऐसी तकनीक पर अक्षम एवं महँगी आर्थिक सहायता देती है जो निकट भविष्य के लिए तैयार नहीं हो सकती।
2. 2030 तक उत्सर्जन में 33% कटौती की भारत की प्रतिबद्धता गैस-आधारित अर्थव्यवस्था पर निर्भर होगी।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'A', 'Correct Answer: Option A (1 only).

1. Why Assumption 1 is valid: The passage contrasts the government''s heavy push and investment in unready renewable technologies against the cautious stance of private businesses, validating the underlying assumption that governments often direct costly fiscal support into technologies that are not yet commercially viable.
2. Why Assumption 2 is invalid: The passage indicates that gas is one part of a multi-pronged transition alongside solar and renewable energy, not that the entire 33% emission reduction target relies solely on a gas-based economy.

Therefore, only assumption 1 is valid.', 'सही उत्तर: विकल्प A (केवल 1)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद दर्शाता है कि सरकार उन नवीकरणीय तकनीकों में भारी निवेश और प्रोत्साहन दे रही है जो अभी पूरी तरह तैयार नहीं हैं और जिनसे निजी क्षेत्र हिचकिचा रहा है, जो यह पूर्वधारणा बनाती है कि सरकारें प्रायः ऐसी तकनीकों पर महँगी सहायता प्रदान करती हैं।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद गैस-आधारित अर्थव्यवस्था के साथ-साथ सौर व अन्य नवीकरणीय ऊर्जा में भारी निवेश का उल्लेख करता है; अतः यह मानना कि पूरी प्रतिबद्धता केवल गैस पर आधारित होगी, गलत है।

अतः केवल पूर्वधारणा 1 वैध है।', NULL),
    ('csat-2020-q64', 64, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Intellectual Property Rights & Traditional Knowledge', 'बौद्धिक संपदा अधिकार एवं पारंपरिक ज्ञान संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Intellectual Property', 'Biopiracy']::TEXT[], 'With reference to the above passage, the following assumptions have been made:
1. Genome editing does not require the transfer of genes from one plant to another.
2. Through genome editing, the chosen genes can be altered precisely in a manner akin to the natural process that helps plants to adapt to the environmental factors.
Which of the above assumptions is/are valid?', 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जीनोम संपादन में एक पादप से दूसरे पर जीनों के स्थानांतरण की आवश्यकता नहीं है।
2. जीनोम संपादन के द्वारा चुनी हुई जीनों को सही रूप में एक प्राकृतिक प्रक्रिया के रूप में परिवर्तित किया जा सकता है जिससे पौधों को पर्यावरण तत्त्वों के साथ अनुकूलित होने में सहायता मिलती है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'C', 'Correct Answer: Option C (Both 1 and 2).

1. Why Assumption 1 is valid: The passage distinguishes genome editing from modification by highlighting that editing involves altering and repairing the plant''s own existing genome rather than introducing external foreign genes from other species.
2. Why Assumption 2 is valid: The passage explicitly states that researchers use molecular tools to mirror the natural evolutionary mutation and repair processes through which plants survive disease attacks, speeding up this adaptive mechanism in laboratories.

Therefore, both assumptions 1 and 2 are valid.', 'सही उत्तर: विकल्प C (1 और 2 दोनों)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद जीनोम संपादन को जीनोम रूपांतरण से भिन्न बताता है क्योंकि इसमें किसी बाहरी पादप से जीन स्थानांतरित करने के बजाय पौधे के अपने ही जीनोम के विशिष्ट भाग को सुधारा जाता है।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद स्पष्ट कहता है कि यह संपादन पादपों की उस प्राकृतिक प्रक्रिया के समान है जो रोगों के आक्रमण के समय अनुकूलन हेतु नए उत्परिवर्तन उत्पन्न करती है।

अतः 1 और 2 दोनों पूर्वधारणाएँ वैध हैं।', NULL),
    ('csat-2020-q65', 65, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Telemedicine & Rural Healthcare Access', 'टेलीमेडिसिन एवं ग्रामीण स्वास्थ्य सेवा पहुँच पर महत्वपूर्ण संदेश', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Healthcare', 'Telemedicine']::TEXT[], 'In the context of India, which one of the following statements best reflects the critical message of the passage?', 'भारत के संदर्भ में, निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'In India, the drainage networks are not separate for sewerage and storm water.', 'Urban local bodies do not have enough resources and legislative authority to deal with the problems of waste management.', 'Solid waste management should be integrated with the maintenance of drainage and sewerage networks.', 'Bad management of solid waste and sewerage systems by our municipalities is the reason for drinking water shortages in our cities.', 'भारत में जल-निकासी तंत्र बारिश के पानी एवं मल-जल के लिए अलग-अलग नहीं हैं।', 'शहरी स्थानीय निकायों के पास अपशिष्ट प्रबंधन की समस्याओं से निपटने के लिए पर्याप्त संसाधन एवं विधायी शक्तियाँ नहीं हैं।', 'ठोस अपशिष्ट प्रबंधन को जल-निकासी और मल-जल निकासी तंत्र के अनुरक्षण के साथ एकीकृत किया जाना चाहिए।', 'हमारी नगरपालिकाओं द्वारा ठोस अपशिष्ट एवं मल-जल प्रणालियों का खराब प्रबंधन हमारे शहरों में पेय जल की कमी के लिए जिम्मेदार है।', 'C', 'Correct Answer: Option C (Solid waste management should be integrated with the maintenance of drainage and sewerage networks).

1. Why Option C is correct: The passage emphasizes that public health hazards arise when unscientific solid waste disposal combines with poor drainage and untreated sewage dumping into storm drains, choking drainage systems and breeding disease. This directly conveys that solid waste management must be integrated with the upkeep of drainage and sewerage networks.
2. Why Option A is incorrect: The passage mentions that storm water drains are misused for dumping sewage, not that separate design networks do not exist.
3. Why Option B is incorrect: Lack of resources and legislative authority of municipal bodies is not discussed in the text.
4. Why Option D is incorrect: The passage links choked drains to vector breeding and water-borne diseases, not to urban drinking water shortages.

Therefore, option C best reflects the critical message.', 'सही उत्तर: विकल्प C (ठोस अपशिष्ट प्रबंधन को जल-निकासी और मल-जल निकासी तंत्र के अनुरक्षण के साथ एकीकृत किया जाना चाहिए)।

1. विकल्प C क्यों सही है: परिच्छेद स्पष्ट करता है कि स्वास्थ्य समस्याएँ तब गंभीर होती हैं जब अवैज्ञानिक ठोस अपशिष्ट प्रबंधन खराब जल-निकासी और नालों में सीवेज डंपिंग के साथ मिल जाता है, जिससे नाले अवरुद्ध होते हैं और बीमारियाँ फैलती हैं। अतः ठोस अपशिष्ट और जल-निकासी प्रणालियों का एकीकृत प्रबंधन ही इसका मुख्य समाधान है।
2. विकल्प A क्यों गलत है: परिच्छेद नालों में अनुचित सीवेज बहाने का उल्लेख करता है, यह अलग नेटवर्क न होने का दावा नहीं करता।
3. विकल्प B क्यों गलत है: नगरपालिकाओं के संसाधनों और विधायी शक्तियों की कमी का परिच्छेद में कोई उल्लेख नहीं है।
4. विकल्प D क्यों गलत है: परिच्छेद का संबंध जल-जनित रोगों और मच्छरों से है, पेय जल की कमी से नहीं।

अतः विकल्प C परिच्छेद के क्रांतिक संदेश को सर्वोत्तम रूप से दर्शाता है।', NULL),
    ('csat-2020-q66', 66, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Early Childhood Malnutrition & Cognitive Development', 'बाल्यावस्था कुपोषण एवं संज्ञानात्मक विकास पर निष्कर्ष', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Child Health', 'Cognitive Development']::TEXT[], 'What is the most logical inference from the above passage?', 'उपर्युक्त परिच्छेद का सर्वाधिक तार्किक निष्कर्ष क्या है?', 'State shall not interfere with the religious affairs of the citizens.', 'Religious freedom under the Constitution is open to State intervention.', 'Religious freedom of the citizens is not covered under fundamental rights.', 'Religious practices of any community are immune to State laws.', 'राज्य नागरिकों के धार्मिक मामलों में हस्तक्षेप नहीं करेगा।', 'संविधान में दी गई धार्मिक स्वतंत्रता में राज्य हस्तक्षेप कर सकता है।', 'नागरिकों की धार्मिक स्वतंत्रता मौलिक अधिकारों के दायरे में नहीं आती।', 'किसी भी समुदाय के धार्मिक आचरण राज्य के कानूनों से प्रतिरक्षित हैं।', 'B', 'Correct Answer: Option B (Religious freedom under the Constitution is open to State intervention).

1. Why Option B is correct: The passage explains that Article 25 is explicitly subject to public order, morality, health, and other fundamental rights (like equality before the law), which empowers the State to regulate and intervene in religious practices to uphold these overarching constitutional principles.
2. Why Option A is incorrect: The passage demonstrates that the State can legitimately intervene when religious practices conflict with public order, morality, health, or equality.
3. Why Option C is incorrect: The passage begins by noting that Article 25 is part of Part III of the Constitution, confirming that religious freedom is indeed a fundamental right.
4. Why Option D is incorrect: The text explicitly refutes immunity by highlighting the subordinating conditional clause attached to religious freedom.

Therefore, option B is the most logical inference.', 'सही उत्तर: विकल्प B (संविधान में दी गई धार्मिक स्वतंत्रता में राज्य हस्तक्षेप कर सकता है)।

1. विकल्प B क्यों सही है: परिच्छेद रेखांकित करता है कि अनुच्छेद 25 में धार्मिक स्वतंत्रता ''लोक व्यवस्था, सदाचार, स्वास्थ्य तथा भाग III के अन्य उपबंधों'' के अधीन है, जिसका अर्थ है कि समता और अन्य अधिकारों की रक्षा के लिए राज्य धार्मिक मामलों में वैधानिक रूप से हस्तक्षेप कर सकता है।
2. विकल्प A क्यों गलत है: परिच्छेद स्पष्ट करता है कि धार्मिक स्वतंत्रता निरपेक्ष नहीं है और राज्य का विनियमन संभव है।
3. विकल्प C क्यों गलत है: परिच्छेद स्वयं बताता है कि अनुच्छेद 25 संविधान के भाग III (मौलिक अधिकार) का हिस्सा है।
4. विकल्प D क्यों गलत है: परिच्छेद के अनुसार धार्मिक आचरण राज्य के कानूनों से प्रतिरक्षित (immune) नहीं हैं।

अतः विकल्प B सर्वाधिक तार्किक निष्कर्ष है।', NULL),
    ('csat-2020-q67', 67, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Word Permutations with Letter Repetition & Distinct Combinations', 'पुनरावर्ती अक्षरों से शब्द निर्माण एवं क्रमचय गणना', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Permutation & Combination', 'Arrangements', 'Word Formation']::TEXT[], 'How many different 5-letter words (with or without meaning) can be constructed using all the letters of the word ''DELHI'' so that each word has to start with D and end with I?', 'शब्द ''DELHI'' के सभी अक्षरों का प्रयोग करते हुए कितने विभिन्न 5-अक्षरी शब्द (जिनका कोई अर्थ हो या न हो) बनाए जा सकते हैं, जबकि प्रत्येक शब्द D के साथ शुरू होता है और I के साथ समाप्त होता है?', '24', '18', '12', '6', '24', '18', '12', '6', 'D', 'Correct Answer: Option D (6).

1. The word ''DELHI'' consists of 5 distinct letters: {D, E, L, H, I}.
2. The 1st letter must be ''D'' (1 choice) and the 5th letter must be ''I'' (1 choice).
3. The remaining 3 middle positions (2nd, 3rd, and 4th) must be filled by the remaining 3 letters {E, L, H}.
4. Number of permutations of these 3 letters = $3! = 3 \times 2 \times 1 = 6$.

Therefore, 6 different 5-letter words can be constructed.', 'सही उत्तर: विकल्प D (6)।

1. शब्द ''DELHI'' में 5 भिन्न अक्षर {D, E, L, H, I} हैं।
2. शब्द का पहला अक्षर ''D'' और अंतिम अक्षर ''I'' निश्चित (fixed) है।
3. मध्य के 3 स्थानों को भरने के लिए शेष 3 अक्षरों {E, L, H} का क्रमचय करना होगा।
4. 3 अक्षरों को व्यवस्थित करने के कुल तरीके = $3! = 3 \times 2 \times 1 = 6$।

अतः कुल 6 विभिन्न शब्द बनाए जा सकते हैं।', NULL),
    ('csat-2020-q68', 68, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Repeated Liquid Replacement & Mixture Dilution Formula', 'क्रमिक द्रव प्रतिस्थापन एवं मिश्रण तनुकरण सूत्र', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Mixtures & Alligations', 'Replacement Formula']::TEXT[], 'A bottle contains 20 litres of liquid A. 4 litres of liquid A is taken out of it and replaced by same quantity of liquid B. Again 4 litres of the mixture is taken out and replaced by same quantity of liquid B. What is the ratio of quantity of liquid A to that of liquid B in the final mixture?', 'एक बोतल में द्रव A की 20 लीटर मात्रा है। इसमें से द्रव A की 4 लीटर मात्रा बाहर निकाल दी जाती है और द्रव B की उतनी ही मात्रा वापस डाल दी जाती है। फिर से मिश्रण की 4 लीटर मात्रा बाहर निकाल दी जाती है और द्रव B की उतनी ही मात्रा वापस डाल दी जाती है। अंतिम मिश्रण में द्रव A की मात्रा का द्रव B की मात्रा से अनुपात क्या है?', '4:1', '5:1', '16:9', '17:8', '4:1', '5:1', '16:9', '17:8', 'C', 'Correct Answer: Option C (16:9).

1. Initial volume of liquid A, $V = 20\text{ L}$, and replacement quantity, $x = 4\text{ L}$.
2. After 2 successive replacement operations, the remaining quantity of liquid A is given by:
   $$\text{Quantity of A} = V \left(1 - \frac{x}{V}\right)^2 = 20 \left(1 - \frac{4}{20}\right)^2 = 20 \left(\frac{4}{5}\right)^2 = 20 \times \frac{16}{25} = 12.8\text{ litres}$$
3. Quantity of liquid B in the final 20-litre mixture:
   $$\text{Quantity of B} = 20 - 12.8 = 7.2\text{ litres}$$
4. Ratio of liquid A to liquid B in the final mixture:
   $$\frac{\text{Quantity of A}}{\text{Quantity of B}} = \frac{12.8}{7.2} = \frac{128}{72} = \frac{16}{9}$$

Therefore, the required ratio is 16:9.', 'सही उत्तर: विकल्प C (16:9)।

1. द्रव A की प्रारंभिक मात्रा $V = 20$ लीटर तथा प्रत्येक बार निकाली गई मात्रा $x = 4$ लीटर है।
2. 2 बार प्रतिस्थापन के बाद द्रव A की शेष मात्रा:
   $$\text{A की मात्रा} = 20 \left(1 - \frac{4}{20}\right)^2 = 20 \times \left(\frac{4}{5}\right)^2 = 20 \times \frac{16}{25} = 12.8 \text{ लीटर}$$
3. 20 लीटर के अंतिम मिश्रण में द्रव B की मात्रा:
   $$\text{B की मात्रा} = 20 - 12.8 = 7.2 \text{ लीटर}$$
4. द्रव A और द्रव B का अनुपात:
   $$\text{A} : \text{B} = 12.8 : 7.2 = 128 : 72 = 16 : 9$$

अतः अंतिम मिश्रण में द्रव A और B का अनुपात 16:9 है।', NULL),
    ('csat-2020-q69', 69, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Batting Averages Progression & Score Calculation', 'बल्लेबाजी औसत संवृद्धि एवं पारी स्कोर गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Sports Arithmetic']::TEXT[], 'The average score of a batsman after his 50th innings was 46.4. After 60th innings, his average score increases by 2.6. What was his average score in the last ten innings?', 'एक बल्लेबाज का उसकी 50वीं पारी के बाद औसत स्कोर 46.4 था। 60वीं पारी के बाद, उसका औसत स्कोर 2.6 बढ़ जाता है। पिछली दस पारियों में उसका औसत स्कोर क्या था?', '122', '91', '62', '49', '122', '91', '62', '49', 'C', 'Correct Answer: Option C (62).

1. Total runs scored in the first 50 innings:
   $$\text{Total Runs}_{50} = 50 \times 46.4 = 2320$$
2. New average after 60 innings $= 46.4 + 2.6 = 49.0$.
3. Total runs scored in 60 innings:
   $$\text{Total Runs}_{60} = 60 \times 49.0 = 2940$$
4. Runs scored in the last 10 innings (from innings 51 to 60):
   $$\text{Runs in last 10} = 2940 - 2320 = 620$$
5. Average score in the last ten innings:
   $$\text{Average} = \frac{620}{10} = 62$$

Therefore, his average score in the last ten innings was 62.', 'सही उत्तर: विकल्प C (62)।

1. 50 पारियों के बाद कुल रन:
   $$\text{कुल रन}_{50} = 50 \times 46.4 = 2320$$
2. 60 पारियों के बाद नया औसत $= 46.4 + 2.6 = 49.0$ रन।
3. 60 पारियों के बाद कुल रन:
   $$\text{कुल रन}_{60} = 60 \times 49.0 = 2940$$
4. अंतिम 10 पारियों में बनाए गए कुल रन $= 2940 - 2320 = 620$ रन।
5. अंतिम दस पारियों का औसत स्कोर:
   $$\text{औसत} = \frac{620}{10} = 62$$

अतः पिछली दस पारियों में उसका औसत स्कोर 62 था।', NULL),
    ('csat-2020-q70', 70, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Price Hike & Consumption Reduction (Expenditure Invariance)', 'मूल्य वृद्धि एवं उपभोग में कमी (व्यय अपरिवर्तनीयता)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Percentages', 'Price & Consumption']::TEXT[], 'As a result of 25% hike in the price of rice per kg, a person is able to purchase 6 kg less rice for ₹1,200. What was the original price of rice per kg?', 'चावल के प्रति किलो मूल्य में 25% की वृद्धि के परिणामस्वरूप, एक व्यक्ति ₹1,200 में 6 किलो कम चावल खरीद पाता है। चावल का प्रति किलो प्रारंभिक मूल्य क्या था?', '30', '40', '50', '60', '30', '40', '50', '60', 'B', 'Correct Answer: Option B (40).

1. Let the original price of rice per kg be $P$.
2. Original quantity purchased for ₹1,200 $= \frac{1200}{P}$.
3. Increased price per kg $= 1.25 P$. New quantity purchased $= \frac{1200}{1.25 P} = \frac{960}{P}$.
4. Set up the difference in quantity:
   $$\frac{1200}{P} - \frac{960}{P} = 6 \implies \frac{240}{P} = 6 \implies P = \frac{240}{6} = 40$$

Therefore, the original price of rice was ₹40 per kg.', 'सही उत्तर: विकल्प B (40)।

1. माना चावल का प्रारंभिक मूल्य $P$ रुपये प्रति किलो है।
2. ₹1,200 में खरीदी गई प्रारंभिक मात्रा $= \frac{1200}{P}$ किलो।
3. 25% मूल्य वृद्धि के बाद नया मूल्य $= 1.25 P$ रुपये। नई मात्रा $= \frac{1200}{1.25 P} = \frac{960}{P}$ किलो।
4. मात्रा का अंतर 6 किलो है:
   $$\frac{1200}{P} - \frac{960}{P} = 6 \implies \frac{240}{P} = 6 \implies P = 40$$

अतः चावल का प्रति किलो प्रारंभिक मूल्य ₹40 था।', NULL),
    ('csat-2020-q71', 71, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Work-Rate Percentages & Combined Task Completion Time', 'कार्य-दर प्रतिशत एवं संयुक्त कार्य पूर्णता समय', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Time, Work & Distance', 'Time and Work', 'Work Rate']::TEXT[], 'A person X can complete 20% of work in 8 days and another person Y can complete 25% of the same work in 6 days. If they work together, in how many days will 40% of the work be completed?', 'एक व्यक्ति X किसी कार्य का 20%, 8 दिनों में पूरा कर सकता है और दूसरा व्यक्ति Y उसी कार्य का 25%, 6 दिनों में पूरा कर सकता है। यदि वे दोनों साथ-साथ काम करते हैं, तो उस कार्य का 40% कितने दिनों में पूरा हो जाएगा?', '6', '8', '10', '12', '6', '8', '10', '12', 'A', 'Correct Answer: Option A (6).

1. Time taken by X to complete 100% of the work $= \frac{8}{0.20} = 40\text{ days}$.
2. Time taken by Y to complete 100% of the work $= \frac{6}{0.25} = 24\text{ days}$.
3. Combined 1-day work rate of X and Y:
   $$\text{Rate} = \frac{1}{40} + \frac{1}{24} = \frac{3 + 5}{120} = \frac{8}{120} = \frac{1}{15}$$
4. Time required to complete 40% (0.40) of the total work:
   $$\text{Days} = \frac{0.40}{1/15} = 0.40 \times 15 = 6\text{ days}$$

Therefore, 40% of the work will be completed in 6 days.', 'सही उत्तर: विकल्प A (6)।

1. X द्वारा 100% कार्य पूरा करने में लगा समय $= \frac{8}{0.20} = 40$ दिन।
2. Y द्वारा 100% कार्य पूरा करने में लगा समय $= \frac{6}{0.25} = 24$ दिन।
3. X और Y द्वारा मिलकर 1 दिन में किया गया कार्य:
   $$\frac{1}{40} + \frac{1}{24} = \frac{3 + 5}{120} = \frac{8}{120} = \frac{1}{15}$$
4. कार्य का 40% (0.40 भाग) पूरा करने में आवश्यक दिन:
   $$\text{दिन} = 0.40 \times 15 = 6 \text{ दिन}$$

अतः 40% कार्य 6 दिनों में पूरा हो जाएगा।', NULL),
    ('csat-2020-q72', 72, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Harmonic Mean of Speeds for Round Trips (Average Speed)', 'आवागमन फेरों के लिए गतियों का हरात्मक माध्य (औसत गति)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Time, Work & Distance', 'Average Speed', 'Harmonic Mean']::TEXT[], 'A car travels from a place X to place Y at an average speed of v km/hr, from Y to X at an average speed of 2v km/hr, again from X to Y at an average speed of 3v km/hr and again from Y to X at an average speed of 4v km/hr. Then the average speed of the car for the entire journey', 'एक कार v km/hr की औसत चाल से स्थान X से स्थान Y तक यात्रा करती है, Y से X तक 2v km/hr की औसत चाल से, फिर X से Y तक 3v km/hr की औसत चाल से और फिर Y से X तक 4v km/hr की औसत चाल से यात्रा करती है। तो संपूर्ण यात्रा के लिए कार की औसत चाल', 'is less than v km/hr', 'lies between v and 2v km/hr', 'lies between 2v and 3v km/hr', 'lies between 3v and 4v km/hr', 'v km/hr से कम है', 'v और 2v km/hr के बीच रहती है', '2v और 3v km/hr के बीच रहती है', '3v और 4v km/hr के बीच रहती है', 'B', 'Correct Answer: Option B (lies between v and 2v km/hr).

1. Let the distance between X and Y be $d$. Total distance for 4 one-way trips $= 4d$.
2. Total time taken for all 4 legs:
   $$T = \frac{d}{v} + \frac{d}{2v} + \frac{d}{3v} + \frac{d}{4v} = \frac{d}{v} \left(1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4}\right) = \frac{d}{v} \left(\frac{12 + 6 + 4 + 3}{12}\right) = \frac{25d}{12v}$$
3. Calculate the overall average speed:
   $$\text{Average Speed} = \frac{\text{Total Distance}}{\text{Total Time}} = \frac{4d}{\frac{25d}{12v}} = \frac{48}{25} v = 1.92 v$$
4. Since $1.92v$ falls strictly in the interval $[v, 2v]$, the average speed lies between $v$ and $2v\text{ km/hr}$.

Therefore, the average speed lies between v and 2v km/hr.', 'सही उत्तर: विकल्प B (v और 2v km/hr के बीच रहती है)।

1. माना X और Y के बीच की दूरी $d$ है। 4 यात्राओं की कुल दूरी $= 4d$।
2. चारों यात्राओं में लगा कुल समय:
   $$T = \frac{d}{v} + \frac{d}{2v} + \frac{d}{3v} + \frac{d}{4v} = \frac{d}{v}\left(1 + \frac{1}{2} + \frac{1}{3} + \frac{1}{4}\right) = \frac{25d}{12v}$$
3. संपूर्ण यात्रा की औसत चाल:
   $$\text{औसत चाल} = \frac{\text{कुल दूरी}}{\text{कुल समय}} = \frac{4d}{\frac{25d}{12v}} = \frac{48}{25} v = 1.92 v$$
4. चूँकि $1.92 v$ का मान $v$ और $2v$ के बीच है, अतः औसत चाल $v$ और $2v\text{ km/hr}$ के बीच रहती है।

अतः विकल्प B सही उत्तर है।', NULL),
    ('csat-2020-q73', 73, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Geometric Intersections of Straight Lines and Circles', 'सरल रेखाओं एवं वृत्तों के ज्यामितीय प्रतिच्छेदन बिंदु', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Mensuration & Geometry', 'Geometry', 'Intersections']::TEXT[], 'Consider the following statements:
1. The minimum number of points of intersection of a square and a circle is 2.
2. The maximum number of points of intersection of a square and a circle is 8.
Which of the above statements is/are correct?', 'निम्नलिखित कथनों पर विचार कीजिए :
1. एक वर्ग और एक वृत्त के प्रतिच्छेदन के बिन्दुओं की न्यूनतम संख्या 2 है।
2. एक वर्ग और एक वृत्त के प्रतिच्छेदन के बिन्दुओं की अधिकतम संख्या 8 है।
उपर्युक्त में से कौन-सा/से कथन सही है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'B', 'Correct Answer: Option B (2 only).

1. Statement 1 is incorrect: A circle and a square can be completely separate without touching (0 points of intersection), or a circle can be tangent to a single side of the square (1 point of intersection). Hence, the minimum number of intersection points is not 2.
2. Statement 2 is correct: A circle can intersect each of the 4 straight line segments (sides) of a square at at most 2 points. Therefore, the maximum number of intersection points is $4 \times 2 = 8$.

Therefore, only statement 2 is correct.', 'सही उत्तर: विकल्प B (केवल 2)।

1. कथन 1 गलत है: एक वृत्त और एक वर्ग पूरी तरह अलग हो सकते हैं (0 प्रतिच्छेदन बिंदु) या वृत्त वर्ग की किसी एक भुजा को स्पर्श कर सकता है (1 प्रतिच्छेदन बिंदु), अतः प्रतिच्छेदन बिंदुओं की न्यूनतम संख्या 2 नहीं है।
2. कथन 2 सही है: एक वृत्त वर्ग की प्रत्येक भुजा (4 भुजाओं) को अधिकतम 2 बिंदुओं पर काट सकता है, अतः प्रतिच्छेदन बिंदुओं की अधिकतम संख्या $4 \times 2 = 8$ हो सकती है।

अतः केवल कथन 2 सही है।', NULL),
    ('csat-2020-q74', 74, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Relative Speed in Upstream and Downstream Rowing', 'धारा के अनुकूल एवं प्रतिकूल नौकायन में सापेक्ष गति', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Time, Work & Distance', 'Boats and Streams', 'Relative Speed']::TEXT[], 'A man takes half time in rowing a certain distance downstream than upstream. What is the ratio of the speed in still water to the speed of current?', 'एक व्यक्ति को धारा की उल्टी दिशा में जाने की अपेक्षा धारा प्रवाह की दिशा में किसी निश्चित दूरी को नाव द्वारा खेने में आधा समय लगता है। अचल पानी में चाल का, धारा की चाल से अनुपात क्या है?', '1:2', '2:1', '1:3', '3:1', '1:2', '2:1', '1:3', '3:1', 'D', 'Correct Answer: Option D (3:1).

1. Let the speed in still water be $u$ and the speed of the current be $v$.
2. Downstream speed $= u + v$, Upstream speed $= u - v$.
3. Since downstream time is half of upstream time for the same distance, downstream speed is twice upstream speed:
   $$u + v = 2(u - v)$$
   $$u + v = 2u - 2v \implies u = 3v \implies \frac{u}{v} = \frac{3}{1}$$

Therefore, the ratio of speed in still water to the speed of current is 3:1.', 'सही उत्तर: विकल्प D (3:1)।

1. माना शांत/अचल पानी में चाल $u$ तथा धारा की चाल $v$ है।
2. अनुप्रवाह (Downstream) चाल $= u + v$ तथा ऊर्ध्वप्रवाह (Upstream) चाल $= u - v$।
3. समान दूरी के लिए अनुप्रवाह में लगा समय ऊर्ध्वप्रवाह के समय का आधा है, अर्थात् अनुप्रवाह की चाल ऊर्ध्वप्रवाह की चाल से दोगुनी है:
   $$u + v = 2(u - v)$$
   $$u + v = 2u - 2v \implies u = 3v \implies \frac{u}{v} = \frac{3}{1}$$

अतः अचल पानी में चाल का धारा की चाल से अनुपात 3:1 है।', NULL),
    ('csat-2020-q75', 75, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Difference of Two Squares & Natural Number Factor Pairs (x^2 - y^2 = k)', 'दो वर्गों का अंतर एवं प्राकृतिक संख्या गुणनखंड युग्म (x^2 - y^2 = k)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Difference of Squares', 'Factor Pairs']::TEXT[], 'How many pairs of natural numbers are there such that the difference of whose squares is 63?', 'प्राकृतिक संख्याओं के ऐसे कितने युग्म हैं, जिनके वर्गों का अंतर 63 है?', '3', '4', '5', '2', '3', '4', '5', '2', 'A', 'Correct Answer: Option A (3).

1. Let the natural numbers be $a$ and $b$ with $a > b$.
   $$a^2 - b^2 = 63 \implies (a - b)(a + b) = 63$$
2. Since $a, b \in \mathbb{N}$, $(a - b)$ and $(a + b)$ must be integer factors of 63 with $a - b < a + b$.
3. Find all positive factor pairs $(x, y)$ of 63 such that $x < y$:
   * **Pair 1**: $a - b = 1, a + b = 63 \implies 2a = 64 \implies a = 32, b = 31$
   * **Pair 2**: $a - b = 3, a + b = 21 \implies 2a = 24 \implies a = 12, b = 9$
   * **Pair 3**: $a - b = 7, a + b = 9 \implies 2a = 16 \implies a = 8, b = 1$
4. This yields exactly 3 valid pairs of natural numbers: $(32, 31), (12, 9),$ and $(8, 1)$.

Therefore, there are 3 such pairs.', 'सही उत्तर: विकल्प A (3)।

1. माना प्राकृतिक संख्याएँ $a$ और $b$ ($a > b$) हैं:
   $$a^2 - b^2 = 63 \implies (a - b)(a + b) = 63$$
2. $a, b$ प्राकृतिक संख्याएँ हैं, अतः $(a - b)$ और $(a + b)$ 63 के धनात्मक गुणनखंड युग्म होंगे जहाँ $(a - b) < (a + b)$।
3. 63 के गुणनखंड युग्मों को हल करने पर:
   * **युग्म 1**: $a - b = 1, a + b = 63 \implies a = 32, b = 31$
   * **युग्म 2**: $a - b = 3, a + b = 21 \implies a = 12, b = 9$
   * **युग्म 3**: $a - b = 7, a + b = 9 \implies a = 8, b = 1$
4. इससे प्राकृतिक संख्याओं के कुल 3 युग्म प्राप्त होते हैं।

अतः प्राकृतिक संख्याओं के ऐसे 3 युग्म हैं।', NULL),
    ('csat-2020-q76', 76, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Sensitivity of Fractional Values to Constant Additive Shifts', 'स्थिर योगात्मक विस्थापन के प्रति भिन्न मानों की संवेदनशीलता', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Fractions', 'Percentage Change']::TEXT[], 'Which one of the following will have minimum change in its value if 5 is added to both numerator and the denominator of the fractions 2/3, 3/4, 4/5 and 5/6?', 'यदि भिन्नों 2/3, 3/4, 4/5 और 5/6 के अंश और हर दोनों में 5 जोड़ दिया जाता है, तो निम्नलिखित में से किस एक के मान में न्यूनतम परिवर्तन होगा?', '2/3', '3/4', '4/5', '5/6', '2/3', '3/4', '4/5', '5/6', 'D', 'Correct Answer: Option D (5/6).

1. For any proper fraction $\frac{a}{b}$, the change when adding $k = 5$ to both numerator and denominator is:
   $$\Delta = \frac{a+5}{b+5} - \frac{a}{b} = \frac{5(b - a)}{b(b + 5)}$$
2. For all given fractions $\frac{2}{3}, \frac{3}{4}, \frac{4}{5}, \frac{5}{6}$, the difference $(b - a) = 1$.
3. Thus, $\Delta = \frac{5}{b(b+5)}$. This change is minimized when the denominator $b(b+5)$ is maximum.
4. Evaluating $b(b+5)$ for each fraction''s denominator:
   * For $\frac{2}{3}$ ($b=3$): $3 \times 8 = 24 \implies \Delta = \frac{5}{24} \approx 0.2083$
   * For $\frac{3}{4}$ ($b=4$): $4 \times 9 = 36 \implies \Delta = \frac{5}{36} \approx 0.1389$
   * For $\frac{4}{5}$ ($b=5$): $5 \times 10 = 50 \implies \Delta = \frac{5}{50} = 0.1000$
   * For $\frac{5}{6}$ ($b=6$): $6 \times 11 = 66 \implies \Delta = \frac{5}{66} \approx 0.0758$

Therefore, 5/6 has the minimum change in value.', 'सही उत्तर: विकल्प D (5/6)।

1. किसी भिन्न $\frac{a}{b}$ के अंश और हर में 5 जोड़ने पर मान में परिवर्तन:
   $$\Delta = \frac{a+5}{b+5} - \frac{a}{b} = \frac{5(b - a)}{b(b + 5)}$$
2. दी गई सभी भिन्नों में $(b - a) = 1$ है। अतः $\Delta = \frac{5}{b(b+5)}$।
3. यह परिवर्तन तब न्यूनतम होगा जब हर $b(b+5)$ का मान अधिकतम होगा (अर्थात् जब $b$ सबसे बड़ा होगा):
   * $\frac{2}{3}$ के लिए: $\Delta = \frac{5}{3 \times 8} = \frac{5}{24} \approx 0.2083$
   * $\frac{3}{4}$ के लिए: $\Delta = \frac{5}{4 \times 9} = \frac{5}{36} \approx 0.1389$
   * $\frac{4}{5}$ के लिए: $\Delta = \frac{5}{5 \times 10} = \frac{5}{50} = 0.1000$
   * $\frac{5}{6}$ के लिए: $\Delta = \frac{5}{6 \times 11} = \frac{5}{66} \approx 0.0758$

अतः भिन्न 5/6 के मान में न्यूनतम परिवर्तन होगा।', NULL),
    ('csat-2020-q77', 77, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Compound Divisibility Rules (Divisible by 3 but Not by 6)', 'मिश्रित विभाज्यता नियम (3 से विभाज्य किंतु 6 से नहीं)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Divisibility Rules', 'Even-Odd Logic']::TEXT[], 'A digit n > 3 is divisible by 3 but not divisible by 6. Which one of the following is divisible by 4?', 'एक अंक n > 3 भाज्य है 3 से लेकिन 6 से भाज्य नहीं है। निम्नलिखित में से कौन-सा एक 4 से भाज्य है?', '2n', '3n', '2n + 4', '3n + 1', '2n', '3n', '2n + 4', '3n + 1', 'D', 'Correct Answer: Option D (3n + 1).

1. $n$ is a single-digit integer strictly greater than 3: $n \in \{4, 5, 6, 7, 8, 9\}$.
2. $n$ is divisible by 3: $n \in \{6, 9\}$.
3. $n$ is not divisible by 6: $n = 9$.
4. Evaluate each option with $n = 9$:
   * Option A: $2n = 2(9) = 18$ (not divisible by 4)
   * Option B: $3n = 3(9) = 27$ (not divisible by 4)
   * Option C: $2n + 4 = 2(9) + 4 = 22$ (not divisible by 4)
   * Option D: $3n + 1 = 3(9) + 1 = 28 = 4 \times 7$ (divisible by 4)

Therefore, 3n + 1 is divisible by 4.', 'सही उत्तर: विकल्प D (3n + 1)।

1. $n$ एक एकल अंक है जो 3 से बड़ा है: $n \in \{4, 5, 6, 7, 8, 9\}$।
2. $n$ 3 से भाज्य है $\implies n = 6$ या $9$।
3. $n$ 6 से भाज्य नहीं है $\implies n = 9$।
4. $n = 9$ मान रखकर विकल्पों की जाँच करने पर:
   * (a) $2n = 2 \times 9 = 18$ (4 से विभाज्य नहीं)
   * (b) $3n = 3 \times 9 = 27$ (4 से विभाज्य नहीं)
   * (c) $2n + 4 = 18 + 4 = 22$ (4 से विभाज्य नहीं)
   * (d) $3n + 1 = 3(9) + 1 = 28$ ($28 = 4 \times 7$, 4 से पूर्णतः विभाज्य)

अतः 3n + 1, 4 से विभाज्य है।', NULL),
    ('csat-2020-q78', 78, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Metric Unit Conversions in Volume, Mass & Cubic Millimetres', 'आयतन, द्रव्यमान एवं घन मिलीमीटर में मीट्रिक इकाई रूपांतरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Mensuration & Geometry', 'Metric Units', 'Volume Conversion']::TEXT[], 'If 1 litre of water weighs 1 kg, then how many cubic millimetres of water will weigh 0.1 gm?', 'यदि 1 लीटर पानी का भार 1 kg है, तो कितने घन मिलीमीटर पानी का भार 0.1 gm होगा?', '1', '10', '100', '1000', '1', '10', '100', '1000', 'C', 'Correct Answer: Option C (100).

1. Establish the relationship between mass and volume:
   $$1\text{ litre} = 1000\text{ cm}^3 = 1000 \times 10^3\text{ mm}^3 = 10^6\text{ mm}^3$$
   $$1\text{ kg} = 1000\text{ gm}$$
2. Therefore, $1000\text{ gm}$ of water corresponds to $10^6\text{ mm}^3$.
3. Find volume per gram:
   $$1\text{ gm of water} = \frac{10^6}{1000} = 1000\text{ mm}^3$$
4. Find volume for $0.1\text{ gm}$:
   $$\text{Volume} = 0.1 \times 1000\text{ mm}^3 = 100\text{ mm}^3$$

Therefore, 100 cubic millimetres of water weighs 0.1 gm.', 'सही उत्तर: विकल्प C (100)।

1. आयतन और द्रव्यमान की इकाइयों का संबंध:
   $$1 \text{ लीटर} = 1000 \text{ सेमी}^3 = 10^6 \text{ मिमी}^3$$
   $$1 \text{ kg} = 1000 \text{ ग्राम}$$
2. अतः 1000 ग्राम पानी का आयतन $= 10^6 \text{ घन मिलीमीटर}$ है।
3. 1 ग्राम पानी का आयतन $= \frac{10^6}{1000} = 1000 \text{ घन मिलीमीटर}$।
4. 0.1 ग्राम पानी का आयतन $= 0.1 \times 1000 = 100 \text{ घन मिलीमीटर}$।

अतः 100 घन मिलीमीटर पानी का भार 0.1 gm होगा।', NULL),
    ('csat-2020-q79', 79, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Linear Weight Systems (Vessel Tare Weight & Fluid Volume)', 'रैखिक भार प्रणाली (पात्र का भार एवं द्रव आयतन)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Linear Equations', 'Word Problems']::TEXT[], 'A vessel full of water weighs 40 kg. If it is one-third filled, its weight becomes 20 kg. What is the weight of the empty vessel?', 'पानी से भरे हुए एक बर्तन का भार 40 kg है। यदि यह एक-तिहाई भरा हुआ है, तो इसका भार 20 kg हो जाता है। खाली बर्तन का भार क्या है?', '10 kg', '15 kg', '20 kg', '25 kg', '10 kg', '15 kg', '20 kg', '25 kg', 'A', 'Correct Answer: Option A (10 kg).

1. Let $V$ be the weight of the empty vessel and $W$ be the weight of water when completely full.
2. Formulate the two given conditions:
   $$V + W = 40 \quad \text{--- (Equation 1)}$$
   $$V + \frac{1}{3}W = 20 \quad \text{--- (Equation 2)}$$
3. Subtract Equation 2 from Equation 1:
   $$\frac{2}{3}W = 20 \implies W = \frac{20 \times 3}{2} = 30\text{ kg}$$
4. Substitute $W = 30$ into Equation 1:
   $$V + 30 = 40 \implies V = 10\text{ kg}$$

Therefore, the weight of the empty vessel is 10 kg.', 'सही उत्तर: विकल्प A (10 kg)।

1. माना खाली बर्तन का भार $V$ तथा पूरी तरह भरे पानी का भार $W$ है।
2. दिए गए कथनों से समीकरण बनाने पर:
   $$V + W = 40 \quad \text{--- (समीकरण 1)}$$
   $$V + \frac{1}{3}W = 20 \quad \text{--- (समीकरण 2)}$$
3. समीकरण 1 में से समीकरण 2 को घटाने पर:
   $$\frac{2}{3}W = 20 \implies W = 30 \text{ kg}$$
4. समीकरण 1 में $W$ का मान रखने पर:
   $$V + 30 = 40 \implies V = 10 \text{ kg}$$

अतः खाली बर्तन का भार 10 kg है।', NULL),
    ('csat-2020-q80', 80, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Slippery Well Clambering Progression & Net Displacement Puzzles', 'फिसलनदार कुआँ चढ़ाई पहेली एवं कुल विस्थापन गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Climbing Puzzles', 'Progression']::TEXT[], 'A frog tries to come out of a dried well 4.5 m deep with slippery walls. Every time the frog jumps 30 cm, slides down 15 cm. What is the number of jumps required for the frog to come out of the well?', 'एक मेंढक फिसलन वाली दीवारों वाले 4.5 m गहरे एक सूखे कुएँ से बाहर आने की कोशिश करता है। प्रत्येक बार मेंढक 30 cm फुदकता है और 15 cm नीचे सरक जाता है। कुएँ से बाहर आने के लिए मेंढक के लिए जरूरी फुदकन की संख्या क्या है?', '28', '29', '30', '31', '28', '29', '30', '31', 'B', 'Correct Answer: Option B (29).

1. Total depth of the well $= 4.5\text{ m} = 450\text{ cm}$.
2. In each regular jump, the frog climbs $30\text{ cm}$ and slides down $15\text{ cm}$, achieving a net gain of $30 - 15 = 15\text{ cm}$.
3. On the final jump, once the frog reaches or crosses the top edge ($450\text{ cm}$), it escapes and does not slide down.
4. Distance required before the final jump $= 450 - 30 = 420\text{ cm}$.
5. Number of jumps to reach $420\text{ cm} = \frac{420}{15} = 28\text{ jumps}$.
6. On the 29th jump, starting from $420\text{ cm}$, the frog jumps $30\text{ cm}$ to reach $420 + 30 = 450\text{ cm}$ (the top of the well).

Therefore, the number of jumps required is 29.', 'सही उत्तर: विकल्प B (29)।

1. कुएँ की कुल गहराई $= 4.5 \text{ m} = 450 \text{ cm}$।
2. प्रत्येक छलाँग में मेंढक 30 cm ऊपर जाता है और 15 cm नीचे सरकता है, अतः प्रति छलाँग शुद्ध प्रगति $= 30 - 15 = 15 \text{ cm}$।
3. अंतिम छलाँग में 450 cm की ऊँचाई पर पहुँचने के बाद वह बाहर आ जाएगा और नीचे नहीं फिसलेगा।
4. अंतिम छलाँग से पहले तय की जाने वाली ऊँचाई $= 450 - 30 = 420 \text{ cm}$।
5. 420 cm तक पहुँचने के लिए आवश्यक छलाँगों की संख्या $= \frac{420}{15} = 28$ छलाँग।
6. 28 छलाँग के बाद वह 420 cm पर होगा; 29वीं छलाँग में वह $420 + 30 = 450 \text{ cm}$ पहुँचकर कुएँ से बाहर आ जाएगा।

अतः मेंढक के लिए जरूरी फुदकन (छलाँगों) की संख्या 29 है।', NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_hindi = EXCLUDED.subject_hindi,
    domain = EXCLUDED.domain,
    domain_hindi = EXCLUDED.domain_hindi,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_hindi = EXCLUDED.sub_topic_hindi,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_hindi = EXCLUDED.question_hindi,
    option_a_english = EXCLUDED.option_a_english,
    option_b_english = EXCLUDED.option_b_english,
    option_c_english = EXCLUDED.option_c_english,
    option_d_english = EXCLUDED.option_d_english,
    option_a_hindi = EXCLUDED.option_a_hindi,
    option_b_hindi = EXCLUDED.option_b_hindi,
    option_c_hindi = EXCLUDED.option_c_hindi,
    option_d_hindi = EXCLUDED.option_d_hindi,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_hindi = EXCLUDED.explanation_hindi,
    image_url = EXCLUDED.image_url;

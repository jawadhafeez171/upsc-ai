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
    ('csat-2020-q1', 1, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Passage Inference & Central Idea (Employment & Social Sector Spending)', 'परिच्छेद निष्कर्ष एवं केंद्रीय विचार (रोज़गार एवं सामाजिक क्षेत्र व्यय)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Employment Generation', 'Social Sector']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
In India, over the last decade or so, labour has been departing agriculture, but is only going to construction and unregistered manufacturing which are not markedly better jobs. Services, where labour tends to be most productive, are not generating the additional jobs the country needs. India will need 24 million or so jobs over the next decade. The new sector, e-commerce, can at best close only half the jobs gap. Only those sectors that drive domestic demand such as health and education can comfortably fill the other half.

Which one of the following is best implied in the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
भारत में, पिछले दशक अथवा उसके आसपास, श्रमिक कृषि से हट रहे हैं, परंतु वे केवल निर्माण तथा गैर-पंजीकृत विनिर्माण में, जो कि स्पष्टतः बेहतर रोज़गार अवसर नहीं है, जा रहे हैं। सेवाएँ, जहाँ श्रम की प्रवृत्ति अधिक उत्पादनकारी होती है, अतिरिक्त रोज़गार अवसर उत्पन्न नहीं कर रही हैं जिनकी देश को आवश्यकता है। भारत को अगले दशक में लगभग 24 मिलियन नौकरियों की आवश्यकता होगी। नया सेक्टर, ई-व्यापार, रोज़गार के अंतर को अधिक-से-अधिक आधा ही भर पाएगा। केवल वे सेक्टर, जो घरेलू माँग को बढ़ावा देते हैं, जैसे स्वास्थ्य तथा शिक्षा, शेष आधे भाग को सुगमतापूर्वक भर सकते हैं।

परिच्छेद में निम्नलिखित में से कौन-सा एक सर्वाधिक महत्त्वपूर्ण निहितार्थ है?', 'Strong measures need to be taken to reduce the rural to urban migration of labour.', 'The working condition in construction and unregistered manufacturing needs to be improved.', 'Service sector has been reducing the problem of unemployment.', 'Increased social sector spending is imperative for large-scale job creation.', 'ग्रामीण से शहरी क्षेत्र में श्रमिकों का प्रवसन कम करने के लिए कड़े कदम उठाने की आवश्यकता है।', 'निर्माण तथा गैर-पंजीकृत विनिर्माण में कार्य करने की स्थितियों में सुधार लाना चाहिए।', 'सेवा सेक्टर बेरोज़गारी की समस्या को कम करता रहा है।', 'बड़े पैमाने पर रोज़गार उपलब्ध करवाने के लिए सामाजिक क्षेत्र में खर्च का बढ़ना आवश्यक है।', 'D', 'Correct Answer: Option D (Increased social sector spending is imperative for large-scale job creation).

1. Why Option D is correct: The passage states that India requires 24 million jobs over the next decade, with e-commerce bridging at best only half of this employment gap. It concludes that only sectors driving domestic demand, specifically health and education (the social sector), can comfortably fill the remaining half, making increased spending in these areas imperative.
2. Why Option A is incorrect: The passage merely notes the transition of labor away from agriculture; it does not advocate taking coercive measures to curb rural-to-urban migration.
3. Why Option B is incorrect: Although the text mentions that construction and unregistered manufacturing are not markedly better jobs, its central message is macro-level employment generation rather than regulatory improvement of working conditions.
4. Why Option C is incorrect: The passage explicitly states that services "are not generating the additional jobs the country needs," contradicting this option.

Therefore, increased social sector spending is imperative for large-scale job creation.', 'सही उत्तर: विकल्प D (बड़े पैमाने पर रोज़गार उपलब्ध करवाने के लिए सामाजिक क्षेत्र में खर्च का बढ़ना आवश्यक है)।

1. विकल्प D क्यों सही है: परिच्छेद में उल्लेख है कि भारत को अगले दशक में 24 मिलियन नौकरियों की आवश्यकता है और ई-व्यापार इस अंतर को केवल आधा ही भर सकता है। शेष आधे रोज़गार अंतर को भरने के लिए घरेलू माँग बढ़ाने वाले क्षेत्रों—स्वास्थ्य और शिक्षा (सामाजिक क्षेत्र)—पर निर्भर रहना होगा, अतः सामाजिक क्षेत्र में व्यय बढ़ाना सर्वाधिक महत्त्वपूर्ण निहितार्थ है।
2. विकल्प A क्यों गलत है: परिच्छेद केवल यह बताता है कि श्रमिक कृषि छोड़ रहे हैं; यह ग्रामीण से शहरी प्रवसन को रोकने के लिए कड़े कदम उठाने का सुझाव नहीं देता।
3. विकल्प B क्यों गलत है: परिच्छेद निर्माण और गैर-पंजीकृत विनिर्माण को बेहतर रोज़गार नहीं मानता, किन्तु इसका मुख्य बिंदु कार्य-स्थितियों में सुधार नहीं बल्कि बड़े पैमाने पर नए रोज़गार सृजित करना है।
4. विकल्प C क्यों गलत है: परिच्छेद स्पष्ट रूप से कहता है कि सेवा क्षेत्र देश की आवश्यकता के अनुरूप अतिरिक्त रोज़गार उत्पन्न नहीं कर रहा है, अतः यह विकल्प सीधे तौर पर गलत है।

अतः बड़े पैमाने पर रोज़गार उपलब्ध करवाने के लिए सामाजिक क्षेत्र में खर्च का बढ़ना आवश्यक है।', NULL),
    ('csat-2020-q2', 2, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing & Privacy Rights in Digital Economy', 'पूर्वधारणा परीक्षण एवं डिजिटल अर्थव्यवस्था में निजता के अधिकार', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Right to Privacy', 'Digital Governance']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
In India, the current focus on the right to privacy is based on some new realities of the digital age. A right is a substantive right only if it works in all situations, and for everyone. A right to free expression for an individual about her exploitation, for instance, is meaningless without actual availability of security that guarantees that private force cannot be used to thwart this right. The role of the State, therefore, is not just to abstain from preventing rightful free expression, but also to actively ensure that private parties are not able to block it.

On the basis of the above passage, the following assumptions have been made:
1. State should have some institutions to ensure its appropriate role in a digital society.
2. State should ensure that private parties do not violate the citizens'' right to privacy.
3. Digital economy is not compatible with the idea of not violating the citizens'' privacy.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में निजता के अधिकार पर वर्तमान फोकस डिजिटल युग की कुछ नवीन वास्तविकताओं पर आधारित है। कोई भी अधिकार वास्तविक अधिकार तभी होता है यदि वह सभी स्थितियों में प्रभावी हो और सभी के लिए हो। उदाहरण के लिए, किसी व्यक्ति का अपने शोषण के विरुद्ध सुरक्षा की वास्तविक उपलब्धता के बिना स्वतंत्र अभिव्यक्ति का अधिकार अर्थहीन है, जो कि यह सुनिश्चित करे कि उसके इस अधिकार को गैर-सरकारी शक्ति के प्रयोग से निष्फल न किया जा सके। इसलिए राज्य की भूमिका आधिकारिक स्वतंत्र अभिव्यक्ति में रुकावट पैदा करने से बचना मात्र ही नहीं है अपितु यह भी सक्रिय रूप से सुनिश्चित करना है कि गैर-सरकारी पक्षकार इसको अवरुद्ध करने में सक्षम न हों।

उपर्युक्त परिच्छेद के आधार पर निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. डिजिटल समाज में राज्य के पास ऐसी संस्थाएँ होनी चाहिए जो इसकी समुचित भूमिका को सुनिश्चित कर सकें।
2. राज्य को सुनिश्चित करना चाहिए कि गैर-सरकारी पक्षकार नागरिकों की निजता के अधिकार का हनन न करें।
3. डिजिटल अर्थव्यवस्था नागरिकों की निजता का हनन न करने के विचार से सुसंगत नहीं है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 and 2', '3 only', '1 and 3', '2 only', '1 और 2', 'केवल 3', '1 और 3', 'केवल 2', 'A', 'Correct Answer: Option A (1 and 2).

1. Why Assumption 1 is valid: The passage argues that the State must play an active protective role rather than merely abstaining from interference. For the State to actively guarantee substantive rights and regulate private power in a digital society, it necessarily requires institutional mechanisms.
2. Why Assumption 2 is valid: The text emphasizes that the State must actively ensure private entities cannot use private force to thwart individual rights, which directly applies to the right to privacy in the digital age.
3. Why Assumption 3 is invalid: The passage discusses new digital realities and institutional responsibilities; it nowhere assumes or implies that the digital economy is fundamentally incompatible with privacy.

Therefore, assumptions 1 and 2 are valid.', 'सही उत्तर: विकल्प A (1 और 2)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद यह प्रतिपादित करता है कि राज्य को केवल हस्तक्षेप से बचना ही नहीं है बल्कि अधिकारों की सुरक्षा हेतु सक्रिय भूमिका निभानी है; डिजिटल समाज में इस भूमिका को सुनिश्चित करने के लिए राज्य के पास उपयुक्त संस्थाओं का होना अनिवार्य पूर्वधारणा है।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद स्पष्ट रूप से कहता है कि राज्य को यह सक्रिय रूप से सुनिश्चित करना चाहिए कि गैर-सरकारी पक्षकार नागरिकों के अधिकारों (जैसे निजता) का हनन न कर सकें।
3. पूर्वधारणा 3 क्यों अवैध है: परिच्छेद डिजिटल युग में अधिकारों के नियमन की बात करता है, यह कहीं भी यह नहीं मानता कि डिजिटल अर्थव्यवस्था निजता के विचार से पूरी तरह असंगत है।

अतः पूर्वधारणाएँ 1 और 2 वैध हैं।', NULL),
    ('csat-2020-q3', 3, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Ecological System Inference & Wetland Conservation', 'पारिस्थितिक तंत्र निष्कर्ष एवं आर्द्रभूमि संरक्षण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Wetlands Ecology', 'Water Resources']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
One of the biggest ironies around water is that it comes from rivers and other wetlands. Yet it is seen as divorced from them. While water is used as a resource, public policy does not always grasp that it is a part of the natural ecosystem. Efforts at engineering water systems are thus efforts at augmenting water supply rather than strengthening the capacities of ecological systems.

Which one of the following is the most logical and rational inference that can be made from the above passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जल के साथ एक सबसे बड़ी विडम्बना यह है कि यह नदियों एवं अन्य आर्द्रभूमियों से आता है। इसके बावजूद उसे, उनसे पृथक् माना जाता है। यद्यपि जल का प्रयोग एक संसाधन या वस्तु के रूप में किया जाता है, लोक नीति सदैव यह नहीं समझ पाती कि यह प्राकृतिक पारिस्थितिक तंत्र का एक हिस्सा है। अतएव जल प्रणाली निर्माण के प्रयास, जल की आपूर्ति में अभिवृद्धि के प्रयास हैं न कि पारिस्थितिक प्रणाली की क्षमताओं को मजबूत बनाने के।

उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तर्कसंगत और विवेकपूर्ण निष्कर्ष निकाला जा सकता है?', 'Rivers and other wetlands should be protected under Ramsar Convention.', 'Engineering water systems should be modernized and further augmented.', 'Wetlands need to be reinforced as more than just open sources of water.', 'Water supply should not be free of cost so as to prevent its misuse or overuse.', 'रामसर समझौते के अंतर्गत नदियों एवं अन्य आर्द्रभूमियों को संरक्षित किया जाना चाहिए।', 'जल प्रणालियों के निर्माण का आधुनिकीकरण किया जाना चाहिए और आगे अभिवृद्धित किया जाना चाहिए।', 'आर्द्रभूमियों को जल के मुक्त स्रोत के रूप से कहीं अधिक प्रबलित करना चाहिए।', 'जल की आपूर्ति निःशुल्क नहीं होनी चाहिए ताकि इसके दुरुपयोग और अति-उपयोग को रोका जा सके।', 'C', 'Correct Answer: Option C (Wetlands need to be reinforced as more than just open sources of water).

1. Why Option C is correct: The passage highlights the flaw in viewing water purely as an extractable resource divorced from natural ecosystems, and critiques policies that focus solely on supply augmentation rather than strengthening ecological systems.
2. Why Option A is incorrect: The Ramsar Convention is an external international framework not mentioned or implied in the text.
3. Why Option B is incorrect: The passage explicitly critiques the one-dimensional engineering approach that focuses merely on augmenting supply.
4. Why Option D is incorrect: Water pricing and economic tariffs are not raised in the passage.

Therefore, option C is the most logical and rational inference.', 'सही उत्तर: विकल्प C (आर्द्रभूमियों को जल के मुक्त स्रोत के रूप से कहीं अधिक प्रबलित करना चाहिए)।

1. विकल्प C क्यों सही है: परिच्छेद इस बात की आलोचना करता है कि जल को पारिस्थितिक तंत्र से अलग केवल एक वस्तु समझा जाता है। यह स्पष्ट निष्कर्ष देता है कि केवल जलापूर्ति की इंजीनियरिंग के बजाय आर्द्रभूमियों और पारिस्थितिक तंत्र की क्षमताओं को सुदृढ़ किया जाना चाहिए।
2. विकल्प A क्यों गलत है: परिच्छेद में रामसर समझौते का कोई उल्लेख नहीं है।
3. विकल्प B क्यों गलत है: परिच्छेद केवल जल प्रणाली निर्माण व आपूर्ति अभिवृद्धि के संकीर्ण दृष्टिकोण पर सवाल उठाता है।
4. विकल्प D क्यों गलत है: जल के मूल्य निर्धारण या शुल्क की परिच्छेद में कोई चर्चा नहीं है।

अतः विकल्प C सर्वाधिक तर्कसंगत और विवेकपूर्ण निष्कर्ष है।', NULL),
    ('csat-2020-q4', 4, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Author''s Tone & Asset Allocation Strategy', 'लेखक की सलाह एवं संपत्ति आवंटन रणनीति', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Financial Risk', 'Asset Allocation']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Asset allocation is the most important investment decision we will ever make, and sadly, most of us do not give that decision the importance it deserves. We are adamant about seeking predictability with our future. We tend to think of investing in risky assets as extremely volatile and value eroding. We also dislike fluctuating returns and the loss of control of investment. We think our money is best left idle, unproductive but safe. There is no asset that is risk-free. We could lose our jobs, our homes can lose value, our banks can go bankrupt, our bonds can default, the government can collapse and companies we chose fondly may cease to exist. But we cannot live life assuming that all these extreme events are waiting to happen, and all at the same time. All these extreme forms of risks we know will not manifest at the same time.

Which one of the following statements best implies the suggestion given by the author of the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
हमारे निवेश निर्णयों में से सबसे महत्त्वपूर्ण होता है संपत्ति का विनिधान, और दुःख की बात है कि हम में से अधिकांश इस निर्णय को उतना महत्त्व नहीं देते जितना वांछित है। हम अपने भविष्य की पूर्वानुमेयता तलाशने के लिए अडिग हैं। हमारी सोच जोखिम-भरी संपत्तियों में निवेश के लिए अत्यधिक चपल एवं मूल्य क्षयण के प्रति अभिमुखित है। हम निवेश के अस्थिर प्रतिफल एवं नियंत्रण-लोप को भी पसंद नहीं करते। हम सोचते हैं कि हमारे धन का निष्क्रिय, अनुत्पादक रहना बेहतर है, पर वह सुरक्षित रहे। परंतु ऐसी कोई संपत्ति नहीं है जो जोखिम-मुक्त हो। हम अपने रोज़गार खो सकते हैं, हमारे घर अपना मूल्य खो सकते हैं, हमारे बैंक दिवालिये हो सकते हैं, हमारे बॉन्ड भुगतान से चूक सकते हैं, सरकार गिर सकती है और हमारे मन मुताबिक चुनी हुई कम्पनियों का अस्तित्व समाप्त हो सकता है। पर हम यह मानकर जीवन नहीं जी सकते कि ये सभी चरम घटनाएँ और वो भी सभी एक साथ घटित होने के लिए तैयार बैठीं हैं। हम जानते हैं कि जोखिम के ये सभी चरम स्वरूप एक साथ प्रकट नहीं होंगे।

निम्न कथनों में से कौन-सा एक परिच्छेद के लेखक द्वारा दी गई सलाह को श्रेष्ठ रूप से निहित करता है?', 'Distribute your wealth across different kinds of assets so that your risks would be minimized.', 'Risk-taking behaviour should be a necessary component of your personality if you want to generate wealth.', 'While making investments, find a trustworthy asset management organization which would manage your wealth for you.', 'You should know that investing your money is a risky business.', 'अपने धन को विभिन्न प्रकार की संपत्तियों में इस प्रकार बाँटें कि आपका जोखिम न्यूनीकृत हो सके।', 'यदि आप धन कमाना चाहते हैं, तो जोखिम उठाने वाला व्यवहार आपके व्यक्तित्व का एक आवश्यक घटक होना चाहिए।', 'निवेश करते समय, एक ऐसे भरोसेमंद संपत्ति-प्रबंधन संगठन/संस्था को खोजिए जो आपके लिए आपके धन का ठीक प्रबंधन कर सके।', 'आपको जानना चाहिए कि आपके धन का निवेश एक जोखिम भरा व्यवसाय है।', 'A', 'Correct Answer: Option A (Distribute your wealth across different kinds of assets so that your risks would be minimized).

1. Why Option A is correct: The author emphasizes asset allocation as the most vital decision and explains that leaving funds idle out of fear is counterproductive because no asset is risk-free, yet extreme risks across different assets do not manifest simultaneously.
2. Why Option B is incorrect: The author advocates prudent portfolio diversification (asset allocation), not developing a generic risk-taking personality.
3. Why Option C is incorrect: Hiring an external asset management firm is not mentioned in the passage.
4. Why Option D is incorrect: This is merely an observation about risk, not the constructive strategic suggestion implied by the author.

Therefore, option A best reflects the author''s suggestion.', 'सही उत्तर: विकल्प A (अपने धन को विभिन्न प्रकार की संपत्तियों में इस प्रकार बाँटें कि आपका जोखिम न्यूनीकृत हो सके)।

1. विकल्प A क्यों सही है: लेखक संपत्ति के विनिधान (Asset allocation) को सर्वोपरि निर्णय बताता है और समझाता है कि कोई भी संपत्ति जोखिम-मुक्त नहीं होती, किन्तु सभी संपत्तियों के चरम जोखिम एक साथ प्रकट नहीं होते। अतः विभिन्न संपत्तियों में धन का विविधीकरण करके जोखिम को न्यूनतम करना ही लेखक की मुख्य सलाह है।
2. विकल्प B क्यों गलत है: लेखक जोखिम उठाने वाले व्यवहार को व्यक्तित्व का हिस्सा बनाने की बात नहीं करता, बल्कि परिसंपत्तियों के संतुलित विनिधान की वकालत करता है।
3. विकल्प C क्यों गलत है: संपत्ति-प्रबंधन संस्था खोजने की बात परिच्छेद में नहीं है।
4. विकल्प D क्यों गलत है: यह केवल जोखिम का एक सामान्य कथन है, लेखक द्वारा दी गई रणनीतिक सलाह नहीं।

अतः विकल्प A लेखक की सलाह को सर्वश्रेष्ठ रूप से व्यक्त करता है।', NULL),
    ('csat-2020-q5', 5, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing in Agricultural Biotechnology Regulation', 'कृषि जैव प्रौद्योगिकी नियमन में पूर्वधारणा परीक्षण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Biotechnology Regulation', 'GM Crops']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Although most of the Genetically Modified (GM) crops cultivated now are genetically engineered for a single trait, in future, crops genetically engineered for more than one trait will be the norm. Thus, biotechnology''s role in agriculture and the regulation of the same cannot be understood solely in the context of the current generation of GM crops. Instead, there is a need to take a comprehensive look, taking into account various aspects, including socio-economic impacts, so that the potential of the technology can be harnessed while minimizing negative impacts. Given the importance of biotechnology in developing varieties that can help in climate change mitigation and adaptation, not using biotechnology as a part of the climate change action plan cannot be an option. Domestic regulation of biotechnology cannot be viewed in isolation of trade policy and obligations under various international treaties and conventions.

With reference to the above passage, the following assumptions have been made:
1. Biotechnology regulation is an evolving process.
2. Participation of people is needed in policy decisions regarding biotechnology regulation.
3. Biotechnology regulation should take into account socio-economic aspects in decision-making.
4. Wider involvement of political executive in biotechnology regulation improves its effectiveness in dealing with the country''s trade policies and international obligations.
Which of the above assumptions are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
यद्यपि आजकल उगायी जाने वाली अधिकतर आनुवंशिकतः रूपांतरित (जी० एम०) फसलें एकल लक्षण के लिए आनुवंशिकतः अभिरचित हैं, भविष्य में फसलों का एक से अधिक लक्षणों के लिए आनुवंशिकतः अभिरचित होना सामान्य मानक होगा। अतः कृषि में जैव प्रौद्योगिकी की भूमिका और उसके नियमन को, अकेले जी० एम० फसलों की वर्तमान पीढ़ी के प्रसंग में नहीं समझा जा सकता। बल्कि विभिन्न पहलुओं को जिनमें सामाजिक-आर्थिक प्रभाव सम्मिलित हैं, ध्यान में रखते हुए एक व्यापक अवलोकन की आवश्यकता है, ताकि नकारात्मक प्रभावों को न्यूनीकृत करते हुए प्रौद्योगिकी की क्षमता का उपयोग किया जा सके। उन किस्मों के विकास में, जो जलवायु परिवर्तन के प्रशमन और अनुकूलन में मददगार हैं, जैव प्रौद्योगिकी के महत्त्व के आलोक में, जलवायु परिवर्तन की कार्य योजना के एक अंश के रूप में जैव प्रौद्योगिकी का उपयोग न करना, एक विकल्प नहीं हो सकता। जैव प्रौद्योगिकी के घरेलू नियमन को व्यापार नीति और विभिन्न अंतर्राष्ट्रीय संधियों तथा सम्मेलनों के अंतर्गत दायित्वों से अलग करके नहीं देखा जा सकता।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जैव प्रौद्योगिकी नियमन एक विकासशील प्रक्रिया है।
2. जैव प्रौद्योगिकी नियमन के विषय में नीति निर्णय के लिए लोगों की भागीदारी की आवश्यकता है।
3. जैव प्रौद्योगिकी नियमन के निर्णयन में सामाजिक-आर्थिक पहलुओं को भी ध्यान में रखना चाहिए।
4. जैव प्रौद्योगिकी नियमन में राजनैतिक कार्यपालिका का व्यापक रूप में शामिल होना देश की व्यापार नीतियों और अंतर्राष्ट्रीय दायित्वों को निपटाने की प्रभाविता में सुधार लाता है।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?', '1, 2 and 4 only', '1 and 3 only', '2, 3 and 4 only', '1, 2, 3 and 4', 'केवल 1, 2 और 4', 'केवल 1 और 3', 'केवल 2, 3 और 4', '1, 2, 3 और 4', 'B', 'Correct Answer: Option B (1 and 3 only).

1. Why Assumption 1 is valid: The passage notes that crops will transition from single-trait to multi-trait engineering and that regulation cannot be understood solely in the current generation''s context, validating that biotechnology regulation is an evolving process.
2. Why Assumption 3 is valid: The text directly mandates taking into account various aspects, including socio-economic impacts, in biotechnology policy.
3. Why Assumption 2 is invalid: Public participation in regulatory policy is neither stated nor presupposed in the passage.
4. Why Assumption 4 is invalid: Aligning domestic regulation with trade policies and international treaties is stated, but broader involvement of the political executive is not assumed or discussed.

Therefore, only assumptions 1 and 3 are valid.', 'सही उत्तर: विकल्प B (केवल 1 और 3)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद बताता है कि भविष्य में बहु-लक्षण फसलें मानक होंगी और नियमन को केवल वर्तमान पीढ़ी के आधार पर नहीं समझा जा सकता, जिससे सिद्ध होता है कि जैव प्रौद्योगिकी नियमन एक निरंतर विकासशील प्रक्रिया है।
2. पूर्वधारणा 3 क्यों वैध है: परिच्छेद स्पष्ट रूप से नियमन में ''सामाजिक-आर्थिक प्रभावों'' को शामिल करने का निर्देश देता है।
3. पूर्वधारणा 2 क्यों अवैध है: नीतिगत निर्णयों में जनता की भागीदारी की आवश्यकता का परिच्छेद में कोई उल्लेख नहीं है।
4. पूर्वधारणा 4 क्यों अवैध है: व्यापार नीतियों और अंतरराष्ट्रीय दायित्वों का उल्लेख है, किन्तु इसमें ''राजनैतिक कार्यपालिका के व्यापक समावेश'' की कोई पूर्वधारणा नहीं है।

अतः केवल 1 और 3 वैध पूर्वधारणाएँ हैं।', NULL),
    ('csat-2020-q6', 6, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Crux Identification (Scope of Agricultural Biotechnology)', 'परिच्छेद का मर्म (कृषि जैव प्रौद्योगिकी का दायरा)', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Crux Analysis', 'Biotechnology']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Although most of the Genetically Modified (GM) crops cultivated now are genetically engineered for a single trait, in future, crops genetically engineered for more than one trait will be the norm. Thus, biotechnology''s role in agriculture and the regulation of the same cannot be understood solely in the context of the current generation of GM crops. Instead, there is a need to take a comprehensive look, taking into account various aspects, including socio-economic impacts, so that the potential of the technology can be harnessed while minimizing negative impacts. Given the importance of biotechnology in developing varieties that can help in climate change mitigation and adaptation, not using biotechnology as a part of the climate change action plan cannot be an option. Domestic regulation of biotechnology cannot be viewed in isolation of trade policy and obligations under various international treaties and conventions.

Which one of the following statements best implies the crux of the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
यद्यपि आजकल उगायी जाने वाली अधिकतर आनुवंशिकतः रूपांतरित (जी० एम०) फसलें एकल लक्षण के लिए आनुवंशिकतः अभिरचित हैं, भविष्य में फसलों का एक से अधिक लक्षणों के लिए आनुवंशिकतः अभिरचित होना सामान्य मानक होगा। अतः कृषि में जैव प्रौद्योगिकी की भूमिका और उसके नियमन को, अकेले जी० एम० फसलों की वर्तमान पीढ़ी के प्रसंग में नहीं समझा जा सकता। बल्कि विभिन्न पहलुओं को जिनमें सामाजिक-आर्थिक प्रभाव सम्मिलित हैं, ध्यान में रखते हुए एक व्यापक अवलोकन की आवश्यकता है, ताकि नकारात्मक प्रभावों को न्यूनीकृत करते हुए प्रौद्योगिकी की क्षमता का उपयोग किया जा सके। उन किस्मों के विकास में, जो जलवायु परिवर्तन के प्रशमन और अनुकूलन में मददगार हैं, जैव प्रौद्योगिकी के महत्त्व के आलोक में, जलवायु परिवर्तन की कार्य योजना के एक अंश के रूप में जैव प्रौद्योगिकी का उपयोग न करना, एक विकल्प नहीं हो सकता। जैव प्रौद्योगिकी के घरेलू नियमन को व्यापार नीति और विभिन्न अंतर्राष्ट्रीय संधियों तथा सम्मेलनों के अंतर्गत दायित्वों से अलग करके नहीं देखा जा सकता।

निम्नलिखित में से कौन-सा कथन परिच्छेद के मर्म को श्रेष्ठ रूप से अंतर्निहित करता है?', 'Precautionary principle is not given importance in current debate on developing GM crops.', 'Biotechnology is not currently used in climate change mitigation and adaptation mechanisms.', 'Biotechnology''s role is not confined to the current priorities of developing GM crops.', 'The negative impacts of biotechnology are not properly understood.', 'जी० एम० फसलों के विकास पर वर्तमान विमर्श में सतर्कता सिद्धांत को महत्त्व नहीं दिया गया है।', 'वर्तमान में जलवायु परिवर्तन प्रशमन और अनुकूलन क्रियाविधियों में जैव प्रौद्योगिकी का उपयोग नहीं किया जाता है।', 'जैव प्रौद्योगिकी की भूमिका जी० एम० फसलों के विकास के लिए आज की प्राथमिकता तक सीमित नहीं है।', 'जैव प्रौद्योगिकी के नकारात्मक परिणाम ठीक ढंग से नहीं समझे गए हैं।', 'C', 'Correct Answer: Option C (Biotechnology''s role is not confined to the current priorities of developing GM crops).

1. Why Option C is correct: The central argument of the passage is that agricultural biotechnology cannot be understood solely within the narrow scope of current single-trait GM crops; its role extends to future multi-trait crops, climate change adaptation, and socio-economic frameworks.
2. Why Option A is incorrect: The "precautionary principle" is not mentioned or central to the debate in the passage.
3. Why Option B is incorrect: The passage argues that biotechnology is essential for climate action, not that it is currently unused.
4. Why Option D is incorrect: Minimizing negative impacts is mentioned, but understanding negative impacts is not the primary thesis or crux.

Therefore, option C best captures the crux of the passage.', 'सही उत्तर: विकल्प C (जैव प्रौद्योगिकी की भूमिका जी० एम० फसलों के विकास के लिए आज की प्राथमिकता तक सीमित नहीं है)।

1. विकल्प C क्यों सही है: परिच्छेद का मुख्य मर्म यही है कि जैव प्रौद्योगिकी की भूमिका केवल आज की एकल-लक्षण जी० एम० फसलों की प्राथमिकताओं तक सीमित नहीं है, बल्कि भविष्य की बहु-लक्षण फसलों और जलवायु परिवर्तन कार्य योजना तक इसका व्यापक विस्तार है।
2. विकल्प A क्यों गलत है: परिच्छेद में ''सतर्कता सिद्धांत'' की कोई चर्चा नहीं है।
3. विकल्प B क्यों गलत है: परिच्छेद जलवायु परिवर्तन में जैव प्रौद्योगिकी के अनिवार्य उपयोग की बात करता है, यह नहीं कहता कि इसका वर्तमान में उपयोग नहीं हो रहा है।
4. विकल्प D क्यों गलत है: नकारात्मक प्रभावों को कम करना एक पहलू है, किन्तु यह पूरे परिच्छेद का केंद्रीय मर्म नहीं है।

अतः विकल्प C परिच्छेद के मर्म को सर्वोत्तम रूप से व्यक्त करता है।', NULL),
    ('csat-2020-q7', 7, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Trailing Zeroes in Products & Factorization (Powers of 2 and 5)', 'गुणनफल में अंतिम शून्य एवं गुणनखंडन (2 और 5 की घातें)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Trailing Zeroes', 'Factorization']::TEXT[], 'How many zeroes are there at the end of the following product?
$$1 \times 5 \times 10 \times 15 \times 20 \times 25 \times 30 \times 35 \times 40 \times 45 \times 50 \times 55 \times 60$$', 'गुणनफल
$$1 \times 5 \times 10 \times 15 \times 20 \times 25 \times 30 \times 35 \times 40 \times 45 \times 50 \times 55 \times 60$$
के अंत में कितने शून्य होंगे?', '10', '12', '14', '15', '10', '12', '14', '15', 'A', 'Correct Answer: Option A (10).

1. Trailing zeroes are formed by the multiplication of factors 2 and 5. The number of zeroes equals $\min(\text{power of 2}, \text{power of 5})$ in the prime factorization.
2. Count the powers of 2 in each factor of the product:
   * $10 = 2^1 \times 5$
   * $20 = 2^2 \times 5$
   * $30 = 2^1 \times 3 \times 5$
   * $40 = 2^3 \times 5$
   * $50 = 2^1 \times 5^2$
   * $60 = 2^2 \times 3 \times 5$
   Total power of 2 = $1 + 2 + 1 + 3 + 1 + 2 = 10$.
3. Count the powers of 5: there are 14 factors of 5 in total.
4. Therefore, the number of trailing zeroes is $\min(10, 14) = 10$.

Therefore, there are 10 zeroes at the end of the product.', 'सही उत्तर: विकल्प A (10)।

1. किसी गुणनफल के अंत में शून्यों की संख्या 2 और 5 के अभाज्य युग्मों $(2 \times 5)$ की न्यूनतम संख्या पर निर्भर करती है।
2. गुणनफल में 2 की कुल घातों की गणना करने पर:
   * $10 = 2^1$
   * $20 = 2^2$
   * $30 = 2^1$
   * $40 = 2^3$
   * $50 = 2^1$
   * $60 = 2^2$
   2 की कुल घात $= 1 + 2 + 1 + 3 + 1 + 2 = 10$.
3. 5 की कुल घात $= 14$ है।
4. अतः अंत में शून्यों की संख्या $\min(10, 14) = 10$ होगी।

अतः गुणनफल के अंत में 10 शून्य होंगे।', NULL),
    ('csat-2020-q8', 8, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', '3-Digit Permutative Place Value & Divisibility Properties', 'तीन-अंकीय स्थानीय मान योग एवं विभाज्यता गुणधर्म', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Place Value', 'Divisibility Rules']::TEXT[], 'Let XYZ be a three-digit number, where $(X+Y+Z)$ is not a multiple of 3. Then $(XYZ+YZX+ZXY)$ is not divisible by', 'माना कि XYZ तीन अंकों की एक संख्या है, जहाँ $(X+Y+Z)$, 3 का गुणांक नहीं है। तब $(XYZ+YZX+ZXY)$ विभाज्य नहीं है', '3', '9', '37', '(X+Y+Z)', '3 से', '9 से', '37 से', '(X+Y+Z) से', 'B', 'Correct Answer: Option B (9).

1. Expanding the three-digit numbers in decimal form:
   $$XYZ = 100X + 10Y + Z$$
   $$YZX = 100Y + 10Z + X$$
   $$ZXY = 100Z + 10X + Y$$
2. Adding the three expressions:
   $$XYZ + YZX + ZXY = 111(X + Y + Z) = 3 \times 37 \times (X + Y + Z)$$
3. The sum is divisible by 3, 37, and $(X + Y + Z)$. Since $(X + Y + Z)$ is given as not a multiple of 3, the total factor of 3 in the sum is exactly 1, meaning it cannot be divisible by $9 = 3^2$.

Therefore, $(XYZ+YZX+ZXY)$ is not divisible by 9.', 'सही उत्तर: विकल्प B (9 से)।

1. तीन अंकों की संख्याओं का स्थानीय मान प्रसार:
   $$XYZ = 100X + 10Y + Z$$
   $$YZX = 100Y + 10Z + X$$
   $$ZXY = 100Z + 10X + Y$$
2. तीनों का योग:
   $$XYZ + YZX + ZXY = 111(X + Y + Z) = 3 \times 37 \times (X + Y + Z)$$
3. यह योग 3, 37 तथा $(X+Y+Z)$ से पूर्णतः विभाज्य है। चूँकि $(X+Y+Z)$ 3 का गुणज नहीं है, अतः इस गुणनफल में 3 की केवल एक घात उपस्थित है, इसलिए यह 9 से विभाज्य नहीं हो सकता।

अतः यह योग 9 से विभाज्य नहीं है।', NULL),
    ('csat-2020-q9', 9, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Linear Equations & Inequality Comparison of Natural Numbers', 'रैखिक समीकरण एवं प्राकृतिक संख्याओं की तुलना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Algebraic Equalities', 'Natural Numbers']::TEXT[], 'Let p, q, r and s be natural numbers such that
$$p-2016=q+2017=r-2018=s+2019$$
Which one of the following is the largest natural number?', 'माना कि p, q, r और s इस प्रकार की प्राकृतिक संख्याएँ हैं कि
$$p-2016=q+2017=r-2018=s+2019$$
है। निम्न में से कौन-सी सबसे बड़ी प्राकृतिक संख्या है?', 'p', 'q', 'r', 's', 'p', 'q', 'r', 's', 'C', 'Correct Answer: Option C (r).

1. Let $p - 2016 = q + 2017 = r - 2018 = s + 2019 = k$, where $k$ is a constant.
2. Solve for each variable:
   * $p = k + 2016$
   * $q = k - 2017$
   * $r = k + 2018$
   * $s = k - 2019$
3. Comparing the values: $r = k + 2018 > p = k + 2016 > q > s$.

Therefore, r is the largest natural number.', 'सही उत्तर: विकल्प C (r)।

1. माना कि $p - 2016 = q + 2017 = r - 2018 = s + 2019 = k$ है।
2. प्रत्येक चर का मान:
   * $p = k + 2016$
   * $q = k - 2017$
   * $r = k + 2018$
   * $s = k - 2019$
3. मानों की तुलना करने पर स्पष्ट है कि $r = k + 2018$ सबसे बड़ा है।

अतः सबसे बड़ी प्राकृतिक संख्या r है।', NULL),
    ('csat-2020-q10', 10, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Sum Rule for Divisibility by 3 & Prime Number Testing', '3 से विभाज्यता का अंक-योग नियम एवं अभाज्य संख्या परीक्षण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Prime Numbers', 'Divisibility by 3']::TEXT[], 'How many five-digit prime numbers can be obtained by using all the digits 1, 2, 3, 4 and 5 without repetition of digits?', 'पाँच अंकों की कितनी अभाज्य संख्याएँ अंकों 1, 2, 3, 4 और 5 के द्वारा, बिना अंकों की पुनरावृत्ति किए हुए, बनाई जा सकती हैं?', 'Zero', 'One', 'Nine', 'Ten', 'शून्य', 'एक', 'नौ', 'दस', 'A', 'Correct Answer: Option A (Zero).

1. The sum of the digits $1, 2, 3, 4, 5$ is:
   $$1 + 2 + 3 + 4 + 5 = 15$$
2. By the divisibility rule for 3, any number whose digits sum to a multiple of 3 is itself divisible by 3.
3. Since 15 is divisible by 3, every 5-digit number formed using these digits without repetition is divisible by 3 and strictly greater than 3, meaning all such numbers are composite.

Therefore, the number of prime numbers that can be obtained is Zero.', 'सही उत्तर: विकल्प A (शून्य)।

1. अंकों 1, 2, 3, 4 और 5 का योग:
   $$1 + 2 + 3 + 4 + 5 = 15$$
2. 3 की विभाज्यता के नियम के अनुसार, यदि अंकों का योग 3 से विभाज्य है तो संख्या भी 3 से विभाज्य होगी।
3. चूँकि 15, 3 से विभाज्य है, अतः इन सभी अंकों से बिना पुनरावृत्ति के बनने वाली प्रत्येक पाँच अंकों की संख्या 3 से विभाज्य होगी और कोई भी संख्या अभाज्य नहीं हो सकती।

अतः प्राप्त होने वाली अभाज्य संख्याओं की संख्या शून्य है।', NULL),
    ('csat-2020-q11', 11, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Cryptarithmetic & Single Symbol Digit Substitution', 'अंक पहेली एवं प्रतीक अंक प्रतिस्थापन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Cryptarithmetic', 'Place Value Puzzles']::TEXT[], 'In the sum
$$\otimes+1\otimes+5\otimes+\otimes\otimes+\otimes1=1\otimes\otimes$$
for which digit does the symbol stand?', 'योग
$$\otimes+1\otimes+5\otimes+\otimes\otimes+\otimes1=1\otimes\otimes$$
में प्रतीक किस अंक को दर्शाता है?', '2', '3', '4', '5', '2', '3', '4', '5', 'B', 'Correct Answer: Option B (3).

1. Let the symbol represent the single digit $x$.
2. Expand each term by place value:
   * $\otimes = x$
   * $1\otimes = 10 + x$
   * $5\otimes = 50 + x$
   * $\otimes\otimes = 10x + x = 11x$
   * $\otimes1 = 10x + 1$
   * $1\otimes\otimes = 100 + 10x + x = 100 + 11x$
3. Equate LHS and RHS:
   $$x + (10 + x) + (50 + x) + 11x + (10x + 1) = 100 + 11x$$
   $$24x + 61 = 100 + 11x$$
   $$13x = 39 \implies x = 3$$

Therefore, the symbol stands for the digit 3.', 'सही उत्तर: विकल्प B (3)।

1. माना कि प्रतीक अंक $x$ को दर्शाता है।
2. स्थानीय मान के अनुसार पदों का विस्तार करने पर:
   * $\otimes = x$
   * $1\otimes = 10 + x$
   * $5\otimes = 50 + x$
   * $\otimes\otimes = 11x$
   * $\otimes1 = 10x + 1$
   * $1\otimes\otimes = 100 + 11x$
3. समीकरण:
   $$x + (10 + x) + (50 + x) + 11x + (10x + 1) = 100 + 11x$$
   $$24x + 61 = 100 + 11x$$
   $$13x = 39 \implies x = 3$$

अतः प्रतीक अंक 3 को दर्शाता है।', NULL),
    ('csat-2020-q12', 12, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'HCF and GCD of Decimals / Fractions in Length Measurement', 'दशमलव/भिन्न का महत्तम समापवर्तक (HCF) एवं लंबाई मापन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'HCF', 'Decimals & Fractions']::TEXT[], 'If you have two straight sticks of length 7.5 feet and 3.25 feet, what is the minimum length can you measure?', 'यदि आपके पास दो सीधी 7-5 फुट और 3-25 फुट की छड़े हैं, तो आप कम-से-कम कितनी लम्बाई नाप सकते हैं?', '0.05 foot', '0.25 foot', '1 foot', '3.25 feet', '0.05 फुट', '0-25 फुट', '1 फुट', '3-25 फुट', 'B', 'Correct Answer: Option B (0.25 foot).

1. The minimum measurable length obtained by combining and difference-measuring two straight sticks is the Highest Common Factor (HCF) of their lengths.
2. Express the lengths as fractions:
   $$7.5 = \frac{15}{2} = \frac{30}{4}\text{ feet}, \quad 3.25 = \frac{13}{4}\text{ feet}$$
3. Calculate the HCF:
   $$\text{HCF}\left(\frac{30}{4}, \frac{13}{4}\right) = \frac{\text{HCF}(30, 13)}{\text{LCM}(4, 4)} = \frac{1}{4} = 0.25\text{ foot}$$
   (Practically achieved by: $7 \times 3.25 - 3 \times 7.5 = 22.75 - 22.50 = 0.25\text{ foot}$).

Therefore, the minimum length that can be measured is 0.25 foot.', 'सही उत्तर: विकल्प B (0.25 फुट)।

1. दो छड़ों की लम्बाइयों के संयोजन और अंतर से नापी जा सकने वाली न्यूनतम लम्बाई उनका महत्तम समापवर्तक (HCF) होती है।
2. भिन्नों में बदलने पर:
   $$7.5 = \frac{30}{4}\text{ फुट}, \quad 3.25 = \frac{13}{4}\text{ फुट}$$
3. भिन्नों का HCF:
   $$\text{HCF}\left(\frac{30}{4}, \frac{13}{4}\right) = \frac{\text{HCF}(30, 13)}{\text{LCM}(4, 4)} = \frac{1}{4} = 0.25\text{ फुट}$$
   (उदाहरणार्थ: $7 \times 3.25 - 3 \times 7.5 = 22.75 - 22.50 = 0.25\text{ फुट}$)।

अतः कम-से-कम 0.25 फुट की लम्बाई नापी जा सकती है।', NULL),
    ('csat-2020-q13', 13, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Prime Number Generation via Sequence Operations', 'अनुक्रम संक्रियाओं द्वारा अभाज्य संख्या निर्माण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Number Series', 'Prime Numbers']::TEXT[], 'A simple mathematical operation in each number of the sequence 14, 18, 20, 24, 30, 32, ... results in a sequence with respect to prime numbers. Which one of the following is the next number in the sequence?', 'अनुक्रम 14, 18, 20, 24, 30, 32, ... की प्रत्येक संख्या में एक सरल गणितीय संक्रिया द्वारा अभाज्य संख्याओं का एक अनुक्रम प्राप्त किया जाता है। निम्न में से कौन-सी अनुक्रम की अगली संख्या है?', '34', '36', '38', '40', '34', '36', '38', '40', 'C', 'Correct Answer: Option C (38).

1. Subtracting 1 from each number in the sequence yields:
   * $14 - 1 = 13$
   * $18 - 1 = 17$
   * $20 - 1 = 19$
   * $24 - 1 = 23$
   * $30 - 1 = 29$
   * $32 - 1 = 31$
2. The sequence $(13, 17, 19, 23, 29, 31)$ is a consecutive series of prime numbers.
3. The next prime number after 31 is 37.
4. Therefore, the next number in the given sequence is $37 + 1 = 38$.

Therefore, the next number in the sequence is 38.', 'सही उत्तर: विकल्प C (38)।

1. अनुक्रम के प्रत्येक पद में से 1 घटाने पर:
   * $14 - 1 = 13$
   * $18 - 1 = 17$
   * $20 - 1 = 19$
   * $24 - 1 = 23$
   * $30 - 1 = 29$
   * $32 - 1 = 31$
2. प्राप्त संख्याएँ $(13, 17, 19, 23, 29, 31)$ क्रमागत अभाज्य संख्याओं का अनुक्रम हैं।
3. 31 के बाद अगली अभाज्य संख्या 37 है, अतः अनुक्रम की अगली संख्या $37 + 1 = 38$ होगी।

अतः अनुक्रम की अगली संख्या 38 है।', NULL),
    ('csat-2020-q14', 14, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Sum of First n Natural Numbers & Torn Page Page-Pair Problem', 'प्रथम n प्राकृतिक संख्याओं का योग एवं फटे पन्नों की संख्या ज्ञात करना', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Arithmetic Progression', 'Sum of Integers']::TEXT[], 'One page is torn from a booklet whose pages are numbered in the usual manner starting from the first page as 1. The sum of the numbers on the remaining pages is 195. The torn page contains which of the following numbers?', 'एक पुस्तिका, जिसके पन्ने सामान्य रूप से हैं, पहले पन्ने की संख्या 1 से प्रारम्भ करते हुए अंकित हैं। इस पुस्तिका से एक पन्ना फाड़ लिया जाता है। बचे हुए पन्नों पर अंकित पृष्ठ संख्याओं का योग 195 है। फटे हुए पन्ने पर निम्न में से कौन-सी संख्याएँ हैं?', '5, 6', '7, 8', '9, 10', '11, 12', '5, 6', '7, 8', '9, 10', '11, 12', 'B', 'Correct Answer: Option B (7, 8).

1. Let the booklet have $n$ pages. The sum of page numbers 1 to $n$ is $S = \frac{n(n+1)}{2}$.
2. Tearing one leaf removes two consecutive page numbers $x$ (odd) and $x+1$ (even). The remaining sum is $S - (2x + 1) = 195$.
3. For $n = 20$, total sum $S = \frac{20 \times 21}{2} = 210$.
4. Sum of numbers on the torn page $= 210 - 195 = 15$.
5. Solving $x + (x + 1) = 15 \implies 2x = 14 \implies x = 7$ and $x + 1 = 8$.

Therefore, the torn page contains the numbers 7 and 8.', 'सही उत्तर: विकल्प B (7, 8)।

1. माना पुस्तिका में कुल $n$ पृष्ठ हैं। 1 से $n$ तक का कुल योग $S = \frac{n(n+1)}{2}$ होता है।
2. एक पन्ना फाड़ने पर दो क्रमागत पृष्ठ संख्याएँ $x$ (विषम) और $x+1$ (सम) अलग होती हैं। अतः $S - (2x + 1) = 195$।
3. $n = 20$ लेने पर कुल योग $S = \frac{20 \times 21}{2} = 210$ प्राप्त होता है।
4. फटे हुए पन्ने की दोनों पृष्ठ संख्याओं का योग $= 210 - 195 = 15$।
5. $x + (x + 1) = 15 \implies 2x = 14 \implies x = 7$ तथा $x+1 = 8$।

अतः फटे हुए पन्ने पर 7 और 8 संख्याएँ हैं।', NULL),
    ('csat-2020-q15', 15, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Letter Sequence Pattern Completion & Repeating Blocks', 'वर्ण अनुक्रम पैटर्न पूर्णता एवं पुनरावर्ती खंड', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Letter Series', 'Pattern Completion']::TEXT[], 'Consider the following arrangement that has some missing letters:
$$abab\_b\_bcb\_dcdcded\_d$$
The missing letters which complete the arrangement are', 'निम्न विन्यास पर ध्यान दीजिए, जिसमें कुछ लुप्त वर्ण हैं :
$$abab\_b\_bcb\_dcdcded\_d$$
लुप्त वर्ण, जो कि विन्यास को पूर्ण करते हैं, हैं', 'a, b, c, d', 'a, b, d, e', 'a, c, c, e', 'b, c, d, e', 'a, b, c, d', 'a, b, d, e', 'a, c, c, e', 'b, c, d, e', 'C', 'Correct Answer: Option C (a, c, c, e).

1. The sequence consists of four alternating 5-letter blocks progressing alphabetically:
   * Block 1: `ababa`
   * Block 2: `bcbcb`
   * Block 3: `cdcdc`
   * Block 4: `deded`
2. Concatenated sequence: `ababa bcbcb cdcdc deded`.
3. Comparing with `abab[_] b[_]bcb [_]dcdc ded[_]d` gives the missing letters in sequence as **a, c, c, e**.

Therefore, the missing letters are a, c, c, e.', 'सही उत्तर: विकल्प C (a, c, c, e)।

1. विन्यास 5-5 अक्षरों के चार एकांतर खंडों का प्रतिरूप है:
   * प्रथम खंड: `ababa`
   * द्वितीय खंड: `bcbcb`
   * तृतीय खंड: `cdcdc`
   * चतुर्थ खंड: `deded`
2. पूर्ण अनुक्रम: `ababa bcbcb cdcdc deded`।
3. दिए गए रिक्त स्थानों `abab[a] b[c]bcb [c]dcdc ded[e]d` की तुलना करने पर लुप्त वर्ण क्रमशः **a, c, c, e** प्राप्त होते हैं।

अतः लुप्त वर्ण a, c, c, e हैं।', NULL),
    ('csat-2020-q16', 16, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Cryptarithmetic Subtraction & Distinct Digits Place Value', 'अंकगणितीय व्यवकलन (घटाव) पहेली एवं स्थानीय मान', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Cryptarithmetic', 'Place Value']::TEXT[], 'Let A3BC and DE2F be four-digit numbers where each letter represents a different digit greater than 3. If the sum of the numbers is 15902, then what is the difference between the values of A and D?', 'माना कि A3BC और DE2F चार अंकों की संख्याएँ हैं, जहाँ प्रत्येक वर्ण 3 से बड़े भिन्न अंक को दर्शाता है। यदि संख्याओं का योग 15902 है, तो A और D के मानों के बीच अंतर क्या है?', '1', '2', '3', '4', '1', '2', '3', '4', 'C', 'Correct Answer: Option C (3).

1. Distinct digits $> 3$ are $\{4, 5, 6, 7, 8, 9\}$.
2. In the addition $A3BC + DE2F = 15902$:
   * **Units place**: $C + F = 12$ (with carry 1) $\implies \{C, F\} = \{4, 8\}$.
   * **Tens place**: $B + 2 + 1 = 10 \implies B = 7$ (with carry 1).
   * **Hundreds place**: $3 + E + 1 = 9 \implies E = 5$ (carry 0).
   * **Thousands place**: $A + D = 15$.
3. The remaining unused digits are $6$ and $9$. Thus, $\{A, D\} = \{6, 9\}$.
4. Difference $= |9 - 6| = 3$.

Therefore, the difference between the values of A and D is 3.', 'सही उत्तर: विकल्प C (3)।

1. 3 से बड़े उपलब्ध भिन्न अंक $\{4, 5, 6, 7, 8, 9\}$ हैं।
2. जोड़ $A3BC + DE2F = 15902$ में:
   * **इकाई**: $C + F = 12$ (हासिल 1) $\implies \{C, F\} = \{4, 8\}$
   * **दहाई**: $B + 2 + 1 = 10 \implies B = 7$ (हासिल 1)
   * **सैकड़ा**: $3 + E + 1 = 9 \implies E = 5$ (हासिल 0)
   * **हजार**: $A + D = 15$
3. शेष बचे अंक $6$ और $9$ हैं, अतः $\{A, D\} = \{6, 9\}$।
4. अंतर $= |9 - 6| = 3$।

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

1. From S1: Total figures $\le 51 \times 2 = 102$. The total can be any value from 0 to 102, so S1 alone is insufficient.
2. From S2: Total figures $\ge 51 \times 1 = 51$. The total can be 51 or much larger, so S2 alone is insufficient.
3. Combining S1 and S2: The total number of figures lies between 51 and 102 inclusive. Because the total could be 80 (not more than 100) or 101/102 (more than 100), a definite Yes or No answer cannot be given.

Therefore, S1 and S2 together are not sufficient to answer the Question.', 'सही उत्तर: विकल्प C (S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं)।

1. कथन S1 से: कुल रेखाचित्र $\le 102$ होंगे (0 से 102 तक), अतः S1 अकेला अपर्याप्त है।
2. कथन S2 से: कुल रेखाचित्र $\ge 51$ होंगे, अतः S2 अकेला भी अपर्याप्त है।
3. दोनों कथनों को मिलाने पर: कुल रेखाचित्रों की संख्या 51 से 102 के बीच होगी। यह संख्या 100 से कम (जैसे 80) भी हो सकती है और 100 से अधिक (जैसे 101) भी हो सकती है, अतः निश्चित उत्तर प्राप्त नहीं होता।

अतः S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', NULL),
    ('csat-2020-q18', 18, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Weighted Averages & Class Proportion Determination', 'भारित औसत एवं कक्षा अनुपात निर्धारण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Weighted Averages', 'Mixtures & Allegations']::TEXT[], 'Consider the following data:
* Average marks in English: Girls = 9, Boys = 8, Overall = 8.8
* Average marks in Hindi: Girls = 8, Boys = 7, Overall = x
What is the value of x in the above table?', 'निम्नलिखित आँकड़ों पर विचार कीजिए:
* अंग्रेजी में माध्य प्राप्तांक: लड़कियाँ = 9, लड़के = 8, कुल माध्य प्राप्तांक = 8.8
* हिन्दी में माध्य प्राप्तांक: लड़कियाँ = 8, लड़के = 7, कुल माध्य प्राप्तांक = x
उपर्युक्त सारणी में x का मान क्या है?', '7.8', '7.6', '7.4', '7.2', '7.8', '7.6', '7.4', '7.2', 'A', 'Correct Answer: Option A (7.8).

1. Let $G$ be the number of girls and $B$ be the number of boys. Using English average marks:
   $$\frac{9G + 8B}{G + B} = 8.8 \implies 9G + 8B = 8.8G + 8.8B \implies 0.2G = 0.8B \implies \frac{G}{B} = 4$$
2. The ratio of Girls to Boys is $4 : 1$.
3. Calculate the overall average marks in Hindi ($x$):
   $$x = \frac{8G + 7B}{G + B} = \frac{8(4) + 7(1)}{4 + 1} = \frac{32 + 7}{5} = \frac{39}{5} = 7.8$$

Therefore, the value of x in the table is 7.8.', 'सही उत्तर: विकल्प A (7.8)।

1. माना लड़कियों की संख्या $G$ और लड़कों की संख्या $B$ है। अंग्रेजी के औसत से:
   $$\frac{9G + 8B}{G + B} = 8.8 \implies 0.2G = 0.8B \implies \frac{G}{B} = \frac{4}{1}$$
2. लड़कियों और लड़कों का अनुपात $4 : 1$ है।
3. हिन्दी के कुल माध्य प्राप्तांक ($x$) का मान:
   $$x = \frac{8(4) + 7(1)}{4 + 1} = \frac{32 + 7}{5} = \frac{39}{5} = 7.8$$

अतः सारणी में x का मान 7.8 है।', NULL),
    ('csat-2020-q19', 19, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Blood Relations, Family Tree & Gender Logic', 'रक्त संबंध, पारिवारिक वृक्ष एवं लिंग निर्धारण तर्क', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Blood Relations', 'Family Tree']::TEXT[], 'A family of two generations consisting of six members P, Q, R, S, T and U has three males and three females. There are two married couples and two unmarried siblings. U is P''s daughter and Q is R''s mother-in-law. T is an unmarried male and S is a male. Which one of the following is correct?', 'एक परिवार की दो पीढ़ियों के छः सदस्यों P, Q, R, S, T और U में तीन पुरुष और तीन महिलाएँ हैं। उनमें दो विवाहित जोड़े और दो अविवाहित सहोदर हैं। U, P की पुत्री है और Q, R की सास है। T अविवाहित पुरुष है और S एक पुरुष है। निम्नलिखित में से कौन-सा सही है?', 'R is U''s husband.', 'R is S''s wife.', 'S is unmarried.', 'None of the above', 'R, U का पति है।', 'R, S की पत्नी है।', 'S अविवाहित है।', 'उपर्युक्त में से कोई नहीं', 'B', 'Correct Answer: Option B (R is S''s wife).

1. There are 3 males and 3 females across 2 generations with 2 married couples and 2 unmarried siblings.
2. Generation 1 consists of $P$ (male) married to $Q$ (female), where $Q$ is the mother-in-law.
3. Generation 2 comprises offspring $S$ (male), $T$ (unmarried male), and $U$ (unmarried female daughter of $P$).
4. $T$ and $U$ are the two unmarried siblings. Therefore, $S$ must be the married son whose wife is $R$ (female), making $Q$ the mother-in-law of $R$.

Therefore, R is S''s wife.', 'सही उत्तर: विकल्प B (R, S की पत्नी है)।

1. परिवार में 3 पुरुष और 3 महिलाएँ हैं, जिनमें 2 विवाहित जोड़े और 2 अविवाहित सहोदर हैं।
2. पहली पीढ़ी: $P$ (पुरुष) और $Q$ (महिला) विवाहित जोड़ा हैं, क्योंकि $Q$ सास है।
3. दूसरी पीढ़ी: $U$ (अविवाहित पुत्री), $T$ (अविवाहित पुत्र) तथा $S$ (पुरुष) हैं।
4. $T$ और $U$ दो अविवाहित सहोदर हैं, अतः $S$ विवाहित पुरुष है और उसकी पत्नी $R$ (महिला) है।

अतः R, S की पत्नी है।', NULL),
    ('csat-2020-q20', 20, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Calendar Odd Days & Leap Year vs Ordinary Year Day-Matching', 'कैलेंडर विषम दिन एवं लीप वर्ष बनाम सामान्य वर्ष वार गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Clocks & Calendar', 'Odd Days']::TEXT[], 'If in a particular year 12th January is a Sunday, then which one of the following is correct?', 'यदि किसी विशेष वर्ष में 12 जनवरी को रविवार है, तो निम्नलिखित में से कौन-सा सही है?', '15th July is a Sunday if the year is a leap year.', '15th July is a Sunday if the year is not a leap year.', '12th July is a Sunday if the year is a leap year.', '12th July is not a Sunday if the year is a leap year.', '15 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', '15 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष नहीं है।', '12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', '12 जुलाई को रविवार नहीं है यदि वर्ष एक अधिवर्ष है।', 'C', 'Correct Answer: Option C (12th July is a Sunday if the year is a leap year).

1. In a leap year, February has 29 days. Count the days between 12th January and 12th July:
   * January remaining = $31 - 12 = 19$ days
   * February = 29 days
   * March = 31 days
   * April = 30 days
   * May = 31 days
   * June = 30 days
   * July = 12 days
2. Total days = $19 + 29 + 31 + 30 + 31 + 30 + 12 = 182$ days.
3. Odd days = $182 \pmod 7 = 0$.
4. Because there are 0 odd days, 12th July falls on the exact same day of the week as 12th January (Sunday).

Therefore, 12th July is a Sunday if the year is a leap year.', 'सही उत्तर: विकल्प C (12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है)।

1. अधिवर्ष (Leap year) में फरवरी में 29 दिन होते हैं। 12 जनवरी से 12 जुलाई के मध्य कुल दिन:
   * जनवरी (शेष) $= 19$ दिन
   * फरवरी $= 29$ दिन
   * मार्च $= 31$ दिन
   * अप्रैल $= 30$ दिन
   * मई $= 31$ दिन
   * जून $= 30$ दिन
   * जुलाई $= 12$ दिन
2. कुल दिन $= 19 + 29 + 31 + 30 + 31 + 30 + 12 = 182$ दिन।
3. $182 \div 7 = 26$ सप्ताह (शेष $= 0$ विषम दिन)।
4. शून्य विषम दिन होने से 12 जुलाई का दिन भी 12 जनवरी के समान रविवार होगा।

अतः 12 जुलाई को रविवार है यदि वर्ष एक अधिवर्ष है।', NULL),
    ('csat-2020-q21', 21, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Implicit Assumptions in Renewable Energy Import Strategy', 'नवीकरणीय ऊर्जा आयात रणनीति में अंतर्निहित पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Renewable Energy', 'Critical Assumptions']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Private investment in general is volatile. Foreign private investment is more volatile because the available investment avenues are significantly greater (i.e., the entire world). Therefore, the responsibility of providing employment cannot be left to Foreign Direct Investment (FDI). The current FDI inflows are volatile over time and across sectors and regions, which is a necessary consequence of their search for the highest returns. The adverse consequences are unstable employment and an accentuation of income and regional inequalities. A probable positive consequence of foreign investment is the inflow of new technology and its subsequent diffusion. However, the technology diffusion is not at all certain because the existing state of physical and human capital in India may prove inadequate for the diffusion.

With reference to the above passage, the following assumptions have been made:
1. Relying on foreign investment in the long run is not an economically sound policy.
2. Policies must be undertaken to reduce volatility in foreign private investment.
3. Policies must be undertaken to strengthen domestic private investment.
4. Public investment should be given priority over private investment.
5. Substantial public investment in education and health should be undertaken.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
निजी निवेश सामान्यतः चपल है। विदेशी निजी निवेश और भी अधिक चपल है क्योंकि उनके लिए उपलब्ध निवेश विकल्प काफी अधिक हैं (अर्थात्, समूचा संसार)। इसलिए रोज़गार देने का दायित्व विदेशी प्रत्यक्ष निवेश (FDI) पर नहीं छोड़ा जा सकता। सांप्रतिक FDI अंतर्वाह सभी समय और सभी सेक्टरों तथा क्षेत्रों के संदर्भ में चपल होता है, जो उनके अधिकतम प्रतिफल की तलाश का आवश्यक परिणाम है। अस्थिर रोज़गार और आय एवं क्षेत्रीय असमानताओं का प्रबलन उसके दुष्परिणाम हैं। विदेशी निवेश का एक संभावित सकारात्मक परिणाम है नई प्रौद्योगिकी का अंतर्वहन और उसका अनुवर्ती विसरण। तथापि, प्रौद्योगिकी विसरण एकदम सुनिश्चित नहीं है, क्योंकि विसरण के लिए भारत में भौतिक एवं मानवीय पूँजी की वर्तमान स्थिति अपर्याप्त साबित हो सकती है।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. दीर्घकाल में विदेशी निवेश पर भरोसा करना आर्थिक रूप से एक सही नीति नहीं है।
2. ऐसी नीतियों को अपनाया जाना चाहिए जो विदेशी निजी निवेश में चपलता को कम कर सकें।
3. घरेलू निजी निवेश को सशक्त बनाने वाली नीतियाँ अपनायी जानी चाहिए।
4. निजी निवेश की अपेक्षा सार्वजनिक निवेश को अधिक प्राथमिकता देनी चाहिए।
5. शिक्षा एवं स्वास्थ्य क्षेत्र में पर्याप्त सार्वजनिक निवेश किया जाना चाहिए।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1, 2 and 4', '1, 3 and 5', '2, 4 and 5', '3 only', '1, 2 और 4', '1, 3 और 5', '2, 4 और 5', 'केवल 3', 'B', 'Correct Answer: Option B (1, 3 and 5)[cite: 3].

1. Why Assumptions 1, 3, and 5 are valid: The author explains that FDI is inherently volatile and leads to unstable employment and growing inequality, which directly implies that relying on it in the long run is economically unsound (Assumption 1)[cite: 3]. Because foreign private capital seeks global avenues, the country must strengthen domestic private investment to secure stable employment (Assumption 3)[cite: 3]. Furthermore, the passage explicitly points out that technology diffusion is hindered by inadequate human and physical capital, assuming that substantial public investment in education and health (human capital) is required (Assumption 5)[cite: 3].
2. Why Assumption 2 is invalid: The passage states that the volatility of FDI is a "necessary consequence of their search for the highest returns" worldwide, meaning this global volatility cannot simply be eliminated by domestic policy[cite: 3].
3. Why Assumption 4 is invalid: The passage does not assume that public investment should universally be prioritized over all private investment; it only critiques the over-reliance on foreign private investment[cite: 3].

Therefore, assumptions 1, 3, and 5 are valid[cite: 3].', 'सही उत्तर: विकल्प B (1, 3 और 5)[cite: 3]।

1. पूर्वधारणाएँ 1, 3 और 5 क्यों वैध हैं: परिच्छेद स्पष्ट करता है कि विदेशी निजी निवेश अत्यधिक चपल होता है तथा अस्थिर रोज़गार व असमानता को जन्म देता है, अतः दीर्घकाल में केवल इस पर निर्भर रहना आर्थिक रूप से सही नीति नहीं है (पूर्वधारणा 1)[cite: 3]। चूँकि विदेशी पूँजी वैश्विक विकल्पों की तलाश में अस्थिर रहती है, इसलिए रोज़गार हेतु घरेलू निजी निवेश को सशक्त बनाना आवश्यक है (पूर्वधारणा 3)[cite: 3]। साथ ही, परिच्छेद बताता है कि भारत में मानवीय पूँजी की अपर्याप्तता के कारण प्रौद्योगिकी विसरण नहीं हो पाता, जो यह पूर्वधारित करता है कि शिक्षा और स्वास्थ्य (मानव पूँजी) में पर्याप्त सार्वजनिक निवेश की आवश्यकता है (पूर्वधारणा 5)[cite: 3]।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद के अनुसार विदेशी निवेश की चपलता वैश्विक स्तर पर अधिकतम प्रतिफल खोजने का ''आवश्यक परिणाम'' है, जिसे केवल घरेलू नीतियों द्वारा कम नहीं किया जा सकता[cite: 3]।
3. पूर्वधारणा 4 क्यों अवैध है: परिच्छेद निजी निवेश के स्थान पर सार्वजनिक निवेश को सामान्य प्राथमिकता देने की बात नहीं करता, बल्कि विदेशी निजी निवेश पर अत्यधिक निर्भरता की सीमाओं को रेखांकित करता है[cite: 3]।

अतः पूर्वधारणाएँ 1, 3 और 5 वैध हैं[cite: 3]।', NULL),
    ('csat-2020-q22', 22, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Practical Implications for Solar Energy Ecosystem in India', 'भारत में सौर ऊर्जा पारिस्थितिकी तंत्र के व्यावहारिक निहितार्थ', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Solar Energy', 'Policy Implications']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
Many opportunities to harness the highly skewed, seasonal and spatial distribution of monsoon flows, which occur in a four-month period from June to September annually, have been lost. Since these few months account for most of the rainfall and consequent freshwater availability, the need for holding rainwater in reservoirs, for subsequently releasing it for use over the year, is a necessity nobody can afford to overlook. Climate change will continue to affect weather conditions and create water shortages and excesses. While millions suffer from droughts and floods, waters in the country''s many rivers flow unutilized, and are discharged into the sea every year.

With reference to the above passage, which of the following could be the most rational and practical implications for India?
1. Inter-linking of rivers should be undertaken.
2. A network of dams and canals should be built across the country for proper distribution of water.
3. Farmers should be provided easy loans for digging borewells.
4. Usage of water for agriculture should be regulated by law.
5. Distribution of river water among regions should be regulated by the Union Government.
Select the correct answer using the code given below.', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
प्रतिवर्ष जून से सितम्बर के चार महीनों के दौरान होने वाले मानसूनी प्रवाहों के अत्यधिक विषम, ऋतुनिष्ठ एवं स्थानिक वितरण के उपयोग के कई अवसरों को खोया जा चुका है। चूँकि इन कुछ महीनों में ही अधिकांश वृष्टि होती है एवं परिणामतः स्वच्छ जल उपलब्ध होता है, जलाशयों में वर्षा के जल के संचयन की आवश्यकता और बाद में वर्ष-भर उपयोग हेतु छोड़ना, एक ऐसी अनिवार्यता है जिसकी कोई उपेक्षा नहीं कर सकता। जलवायु परिवर्तन मौसम की स्थितियों को सदा प्रभावित करता रहेगा और जल की अल्पता तथा इसके आधिक्य को उत्पन्न करेगा। जहाँ लाखों लोग सूखे एवं बाढ़ से पीड़ित होते हैं वहीं देश की कई नदियों में पानी अप्रयुक्त बहता रहता है और प्रत्येक वर्ष समुद्र में बह जाता है।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा भारत की दृष्टि से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हो सकता है?
1. नदियों के अंतःसंबंधन को प्रारंभ किया जाना चाहिए।
2. जल के यथोचित वितरण के लिए पूरे देश में बाँधों एवं नहरों के नेटवर्क का निर्माण किया जाना चाहिए।
3. कृषकों को बोरवेल की खुदाई के लिए सुलभ ऋण दिया जाना चाहिए।
4. कृषि में जल के प्रयोग को कानूनी रूप से नियंत्रित किया जाना चाहिए।
5. केन्द्र सरकार द्वारा विभिन्न क्षेत्रों में नदियों के जल के वितरण को नियंत्रित किया जाना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1 and 2', '2, 4 and 5', '1, 3 and 4', '2, 3 and 5', '1 और 2', '2, 4 और 5', '1, 3 और 4', '2, 3 और 5', 'A', 'Correct Answer: Option A (1 and 2)[cite: 3].

1. Why Statements 1 and 2 are correct: The author highlights that monsoon flows are concentrated within four months and distributed unevenly, leading simultaneously to droughts and floods while unutilized river water flows into the sea[cite: 3]. Storing rainwater in reservoirs and distributing it across regions directly points to building a network of dams/canals (2) and undertaking the inter-linking of rivers to transfer surplus water to deficit basins (1)[cite: 3].
2. Why Statement 3 is incorrect: Digging more borewells accelerates groundwater depletion and does not address the passage''s primary focus on capturing unutilized seasonal surface monsoon flows[cite: 3].
3. Why Statements 4 and 5 are incorrect: Legal rationing of agricultural water and centralizing river water distribution are governance issues not derived as direct physical solutions from the text[cite: 3].

Therefore, statements 1 and 2 are the most rational and practical implications[cite: 3].', 'सही उत्तर: विकल्प A (1 और 2)[cite: 3]।

1. कथन 1 और 2 क्यों सही हैं: परिच्छेद स्पष्ट करता है कि वर्षा जल का चार महीनों में विषम वितरण सूखे और बाढ़ का कारण बनता है, जबकि नदियों का जल अप्रयुक्त रहकर समुद्र में बह जाता है[cite: 3]। इसे रोकने हेतु जलाशयों में जल संचयन और वर्ष भर वितरण के लिए बाँधों व नहरों के नेटवर्क का निर्माण (2) तथा जल अधिशेष वाली नदियों को जल की कमी वाले क्षेत्रों से जोड़ने हेतु नदियों का अंतःसंबंधन (1) सर्वाधिक तार्किक और व्यावहारिक समाधान हैं[cite: 3]।
2. कथन 3 क्यों गलत है: बोरवेल की खुदाई को बढ़ावा देना भूजल का दोहन बढ़ाता है, जबकि परिच्छेद सतही मानसूनी जल के संचयन की बात करता है[cite: 3]।
3. कथन 4 और 5 क्यों गलत हैं: कृषि जल के कानूनी नियमन या केंद्र सरकार द्वारा जल वितरण के नियंत्रण की चर्चा परिच्छेद के भौतिक जल-प्रबंधन समाधान से सीधे संबंधित नहीं है[cite: 3]।

अतः केवल 1 और 2 सही निहितार्थ हैं[cite: 3]।', NULL),
    ('csat-2020-q23', 23, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Fiscal Policy & Progressive Taxation Assumptions', 'राजकोषीय नीति एवं प्रगतिशील कराधान पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Taxation', 'Income Inequality']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
People will invest in education whenever they are granted the economic freedom to fully enjoy its benefits. Again, this is for the obvious reason that the return on education increases as the level of economic freedom rises. When people, thanks to lower tax rates, are allowed to retain most of the higher income that they gain from each incremental level of education, it makes eminent sense to invest in education. On the other hand, when the government decides to tax the higher income of educated individuals at even higher rates, it makes very little sense to invest in educating oneself further. The same incentives apply to parents who decide on whether to invest in their children''s education.

With reference to the above passage, the following assumptions have been made:
1. Lower tax rates in a country invariably translate into greater investments in higher education.
2. Investment in the education of children ensures their economic freedom.
3. Economic freedom has a positive impact on building up human capital.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जब शिक्षा से मिलने वाले लाभ का उपयोग करने की आर्थिक स्वतंत्रता प्राप्त होगी, तभी लोग शिक्षा में निवेश करेंगे। इस प्रत्यक्ष कारण की वजह से आर्थिक स्वतंत्रता के स्तर में वृद्धि के साथ ही शिक्षा से प्राप्त होने वाला लाभ भी बढ़ जाता है। निम्न कर दरों के कारण जब लोगों को शिक्षा के प्रत्येक बढ़ते स्तर से प्राप्त बढ़ी हुई आय के अधिकांश भाग को अपने पास रखने की अनुमति होती है तब शिक्षा में निवेश एक अच्छी सूझ-बूझ की बात होती है। दूसरी ओर जब सरकार शिक्षित व्यक्तियों की बढ़ी हुई आय पर और ऊँची दरों पर कर लगाने का निर्णय लेती है, तब स्वयं को अधिक शिक्षित करने में निवेश करना समझदारी की बात नहीं लगती। यही प्रोत्साहन उन अभिभावकों पर भी लागू होता है जिन्हें यह निर्णय लेना है कि वे अपने बच्चों की शिक्षा पर निवेश करें या नहीं।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. किसी देश में निम्न कर दर निरपवाद रूप से उच्च शिक्षा में अधिक निवेश के लिए परिणत हो जाती हैं।
2. बच्चों की शिक्षा में निवेश उनकी आर्थिक स्वतंत्रता को सुनिश्चित करता है।
3. आर्थिक स्वतंत्रता का मानव पूँजी निर्माण पर सकारात्मक प्रभाव होता है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', '3 only', '1, 2 and 3', 'केवल 1', 'केवल 2', 'केवल 3', '1, 2 और 3', 'C', 'Correct Answer: Option C (3 only)[cite: 3].

1. Why Assumption 3 is valid: The passage establishes that granting economic freedom increases the return on education, encouraging individuals and parents to invest in education, which directly translates into building human capital[cite: 3].
2. Why Assumption 1 is invalid: The word "invariably" is an absolute and rigid generalization; lower tax rates incentivize education investment, but do not invariably guarantee it in every circumstance[cite: 3].
3. Why Assumption 2 is invalid: The passage views economic freedom as a prerequisite incentive for investing in education, not that investing in education automatically "ensures" economic freedom (the causal direction is reversed)[cite: 3].

Therefore, only assumption 3 is valid[cite: 3].', 'सही उत्तर: विकल्प C (केवल 3)[cite: 3]।

1. पूर्वधारणा 3 क्यों वैध है: परिच्छेद का केंद्रीय विचार है कि जब लोगों को आर्थिक स्वतंत्रता मिलती है, तो शिक्षा पर मिलने वाला प्रतिफल बढ़ता है और वे शिक्षा में अधिक निवेश करते हैं, जिसका मानव पूँजी निर्माण पर प्रत्यक्ष सकारात्मक प्रभाव पड़ता है[cite: 3]।
2. पूर्वधारणा 1 क्यों अवैध है: ''निरपवाद रूप से'' (invariably) एक अतिवादी शब्द है; निम्न कर दरें शिक्षा में निवेश को प्रोत्साहित करती हैं, किन्तु यह आवश्यक नहीं कि वे हर स्थिति में उच्च शिक्षा में अधिक निवेश में ही परिणत हों[cite: 3]।
3. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद आर्थिक स्वतंत्रता को शिक्षा में निवेश का कारण मानता है, न कि यह कि शिक्षा में निवेश स्वतः बच्चों की आर्थिक स्वतंत्रता को ''सुनिश्चित'' कर देता है[cite: 3]।

अतः केवल पूर्वधारणा 3 वैध है[cite: 3]।', NULL),
    ('csat-2020-q24', 24, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Crucial Message on Tax Revenues & Inclusive Growth', 'कर राजस्व एवं समावेशी विकास पर महत्वपूर्ण संदेश', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Inclusive Growth', 'Tax Policy']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Our urban bodies cannot possibly ensure sustainable delivery of water in our cities unless financing mechanisms are put in place. Water delivery requires heavy investment in collecting it from a natural source, treating it to make it potable, and laying a distribution network of pipes for delivery to the users. It also requires investments in sewerage infrastructure and sewage treatment plants so that the sewers can carry the wastewater to these plants to ensure that no untreated sewage is discharged back into natural water bodies. If our cities were rich enough to meet the entire cost, water could be delivered free. They are not.

What is the most logical and crucial message conveyed by the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
जब तक वित्तीयन तंत्र स्थापित न हो जाए तब तक हमारे शहरी निकाय संभवतः हमारे शहरों में जलापूर्ति की धारणीय व्यवस्था सुनिश्चित नहीं कर सकते। जलापूर्ति के लिए प्राकृतिक स्रोतों से जल संचित करने, उसे पीने योग्य बनाने की अभिक्रिया, तथा उपभोक्ताओं तक उसकी आपूर्ति करने के लिए पाइपों के जल-वितरण नेटवर्क बिछाने में भारी निवेश की आवश्यकता होती है। उसमें मल-प्रबंधन अधःसंरचना एवं मल-जल अभिक्रिया संयंत्रों में भी निवेश की आवश्यकता होती है, जिससे मल-प्रणाल अपशिष्ट जल को इन संयंत्रों तक ले जा सकें और यह सुनिश्चित किया जा सके कि असंसाधित मल-जल प्राकृतिक जल निकायों में बिलकुल ही नहीं छोड़ा जाए। यदि हमारे शहर इतने समृद्ध होते कि वो पूरी लागत को वहन कर सकते तो जल की निःशुल्क पूर्ति की जा सकती है। वे ऐसे नहीं हैं।

परिच्छेद द्वारा संप्रेषित सर्वाधिक तार्किक और निर्णायक संदेश क्या है?', 'Urban local bodies must recover costs through user charges.', 'Urban local bodies are not efficient enough to meet the water requirements of our cities.', 'Water shortage in our cities is a perennial problem that cannot be solved.', 'In view of the water crisis in our cities, there is an urgent need to limit the population of cities by adopting an upper limit of population size.', 'शहरी स्थानीय निकायों को उपभोक्ता शुल्कों के माध्यम से लागत वसूलनी चाहिए।', 'शहरी स्थानीय निकाय हमारे शहरों की जल आवश्यकताओं को पूर्ण करने के लिए पर्याप्त रूप से दक्ष नहीं हैं।', 'हमारे शहरों में जल का अभाव एक चिरस्थायी समस्या है जिसका समाधान सम्भव नहीं है।', 'हमारे शहरों में जल संकट की दृष्टि से यह बहुत आवश्यक है कि शहरों में जनसंख्या का एक अधिकतम आकार निर्धारित कर शहरों की जनसंख्या को सीमित किया जाए।', 'A', 'Correct Answer: Option A (Urban local bodies must recover costs through user charges)[cite: 3].

1. Why Option A is correct: The passage emphasizes that water delivery and sewage treatment require massive investments and that cities are not wealthy enough to supply water for free[cite: 3]. It argues that sustainable delivery is impossible without financing mechanisms, logically concluding that urban bodies must recover operational and capital costs through user charges[cite: 3].
2. Why Option B is incorrect: The passage attributes the problem to financial constraints, not to the operational inefficiency of urban local bodies[cite: 3].
3. Why Option C is incorrect: The passage does not claim water shortages are permanently insoluble; it provides a structural financing solution[cite: 3].
4. Why Option D is incorrect: Imposing an upper limit on city populations is an external idea not suggested by the author[cite: 3].

Therefore, option A is the most logical and crucial message[cite: 3].', 'सही उत्तर: विकल्प A (शहरी स्थानीय निकायों को उपभोक्ता शुल्कों के माध्यम से लागत वसूलनी चाहिए)[cite: 3]।

1. विकल्प A क्यों सही है: परिच्छेद स्पष्ट करता है कि जल शोधन, वितरण और सीवेज उपचार में भारी पूँजी की आवश्यकता होती है और शहर इतने समृद्ध नहीं हैं कि निःशुल्क जलापूर्ति कर सकें[cite: 3]। अतः धारणीय व्यवस्था बनाए रखने के लिए वित्तीय तंत्र स्थापित कर उपभोक्ता शुल्कों (User charges) से लागत वसूलना ही मुख्य संदेश है[cite: 3]।
2. विकल्प B क्यों गलत है: परिच्छेद शहरी निकायों की प्रशासनिक अक्षमता की बात नहीं करता, बल्कि वित्तीय साधनों की कमी पर केंद्रित है[cite: 3]।
3. विकल्प C क्यों गलत है: परिच्छेद समस्या को समाधान-विहीन नहीं मानता बल्कि इसके लिए वित्तीय तंत्र की स्थापना का समाधान सुझाता है[cite: 3]।
4. विकल्प D क्यों गलत है: शहरों की जनसंख्या पर अधिकतम सीमा लगाने का विचार परिच्छेद में नहीं है[cite: 3]।

अतः विकल्प A सर्वाधिक तार्किक और निर्णायक संदेश है[cite: 3]।', NULL),
    ('csat-2020-q25', 25, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumption Testing on Urbanization & Spatial Inequality', 'शहरीकरण एवं स्थानिक असमानता पर पूर्वधारणा परीक्षण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Urban Planning', 'Agglomeration']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Our urban bodies cannot possibly ensure sustainable delivery of water in our cities unless financing mechanisms are put in place. Water delivery requires heavy investment in collecting it from a natural source, treating it to make it potable, and laying a distribution network of pipes for delivery to the users. It also requires investments in sewerage infrastructure and sewage treatment plants so that the sewers can carry the wastewater to these plants to ensure that no untreated sewage is discharged back into natural water bodies. If our cities were rich enough to meet the entire cost, water could be delivered free. They are not.

With reference to the above passage, the following assumptions have been made:
1. Rich cities only can ensure sustainable delivery of water.
2. Sustainable delivery of water in cities means much more than supplying water to households.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
जब तक वित्तीयन तंत्र स्थापित न हो जाए तब तक हमारे शहरी निकाय संभवतः हमारे शहरों में जलापूर्ति की धारणीय व्यवस्था सुनिश्चित नहीं कर सकते। जलापूर्ति के लिए प्राकृतिक स्रोतों से जल संचित करने, उसे पीने योग्य बनाने की अभिक्रिया, तथा उपभोक्ताओं तक उसकी आपूर्ति करने के लिए पाइपों के जल-वितरण नेटवर्क बिछाने में भारी निवेश की आवश्यकता होती है। उसमें मल-प्रबंधन अधःसंरचना एवं मल-जल अभिक्रिया संयंत्रों में भी निवेश की आवश्यकता होती है, जिससे मल-प्रणाल अपशिष्ट जल को इन संयंत्रों तक ले जा सकें और यह सुनिश्चित किया जा सके कि असंसाधित मल-जल प्राकृतिक जल निकायों में बिलकुल ही नहीं छोड़ा जाए। यदि हमारे शहर इतने समृद्ध होते कि वो पूरी लागत को वहन कर सकते तो जल की निःशुल्क पूर्ति की जा सकती है। वे ऐसे नहीं हैं।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. केवल धनी शहर ही जल की धारणीय आपूर्ति को सुनिश्चित कर सकते हैं।
2. शहरों में जल की धारणीय आपूर्ति का अर्थ कुटुम्बों को जल की आपूर्ति करने से कहीं अधिक है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'B', 'Correct Answer: Option B (2 only)[cite: 3].

1. Why Assumption 2 is valid: The passage explains that sustainable water delivery involves a comprehensive cycle: collecting water, purifying it, laying distribution pipes, and building sewerage infrastructure and treatment plants to protect natural water bodies[cite: 3].
2. Why Assumption 1 is invalid: The passage states that rich cities could deliver water for *free*, but any city can ensure sustainable delivery by putting proper financing mechanisms (cost-recovery tariffs) in place, not exclusively rich cities[cite: 3].

Therefore, only assumption 2 is valid[cite: 3].', 'सही उत्तर: विकल्प B (केवल 2)[cite: 3]।

1. पूर्वधारणा 2 क्यों वैध है: परिच्छेद के अनुसार धारणीय जलापूर्ति केवल घरों में पानी पहुँचाने तक सीमित नहीं है, बल्कि इसमें जल शोधन, वितरण पाइपलाइन बिछाना, मल-जल प्रबंधन और प्रदूषण नियंत्रण के लिए उपचार संयंत्र लगाना भी शामिल है[cite: 3]।
2. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद कहता है कि यदि शहर धनी होते तो पानी *मुफ़्त* दे सकते थे; किन्तु उपयुक्त वित्तीय तंत्र अपनाकर कोई भी शहर धारणीय जलापूर्ति सुनिश्चित कर सकता है, केवल धनी शहर ही नहीं[cite: 3]।

अतः केवल पूर्वधारणा 2 वैध है[cite: 3]।', NULL),
    ('csat-2020-q26', 26, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Structural Transformation in Agriculture', 'कृषि में संरचनात्मक रूपांतरण संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Agrarian Economy', 'Rural Distress']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In India, agriculture still engages about half of its workforce, and about 85 per cent of its farms are small and marginal. Compared to China and Vietnam, which have experienced fast structural and rural transformation, India''s story is of slow transformation. As a result, poverty reduction in India was at a much slower pace during 1988-2014, compared to China and Vietnam. India''s poverty reduction was slow during 1988-2005, but during 2005-2012, it accelerated dramatically-almost three times faster than during the earlier period. What did India do during this period? Research reveals that the relative price scenario changed significantly (by more than 50%) in favour of agriculture in the wake of rising global prices. This boosted private investments in agriculture by more than 50%. As a result, agri-GDP growth touched 4.1% during 2007-2012 as against 2.4% during 2002-2007. The net surplus of agri-trade touched $25 billion in 2013-2014; real farm wages rose by 7% per annum. All this led to unprecedented fall in poverty.

With reference to the above passage, the following assumptions have been made:
1. Structural and rural transformation is impossible when farms are mainly small and marginal.
2. A good price incentive can trigger investments in agriculture.
3. India needs to build value chains for high-value agri-products like livestock and horticulture.
4. Higher global prices of agricultural commodities are essential for India''s poverty reduction.
Which of the above assumptions are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में, अभी भी लगभग पचास प्रतिशत कामगार कृषि में विनियोजित हैं, तथा लगभग 85 प्रतिशत खेत छोटे और सीमांत हैं। चीन और वियतनाम की तुलना में, जहाँ तेज़ गति से संरचनात्मक और ग्रामीण परिवर्तन हुए, भारत की कहानी धीमे परिवर्तन की है। परिणामस्वरूप भारत में गरीबी-ह्रास, चीन और वियतनाम की तुलना में, 1988-2014 के बीच बहुत धीमी गति का था। भारत का गरीबी-ह्रास 1988-2005 के बीच धीमा था, परंतु 2005-2012 के दौरान यह नाटकीय गति से बढ़ा-पूर्व के काल की तुलना में तीन गुना तेज़ गति से। इस काल में भारत ने क्या किया ? शोध से पता चलता है कि सापेक्ष कीमतों का दृश्यलेख, बढ़ती वैश्विक कीमतों के परिणामस्वरूप, कृषि के पक्ष में महत्त्वपूर्ण ढंग से परिवर्तित हुआ है (50% से भी अधिक)। इससे कृषि में निजी निवेश 50% से भी अधिक बढ़ा। परिणामस्वरूप, कृषि-जी० डी० पी० की वृद्धि ने 2002-2007 के 2.4% के मुकाबले 2007-2012 में 4.1% के स्तर को छुआ। कृषि-व्यापार के निवल अधिशेष ने 2013-2014 में $25 बिलियन के स्तर को छुआ; वास्तविक कृषि मज़दूरी 7% प्रति वर्ष की दर से बढ़ी। इन सबके कारण गरीबी में अभूतपूर्व गिरावट आई।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जब कृषि जोत मूलतः छोटे और सीमांत हों तब संरचनात्मक और ग्रामीण परिवर्तन असंभव है।
2. अच्छी कीमत प्रोत्साहन कृषि में निवेश को प्रेरित कर सकती है।
3. भारत के लिए उच्च मूल्य के कृषि उत्पादों, जैसे कि पशुधन और बागवानी, के लिए मूल्य-श्रृंखलाओं (value chains) को बनाने की आवश्यकता है।
4. कृषि-माल की उच्च वैश्विक कीमतें भारत के गरीबी-ह्रास के लिए आवश्यक हैं।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?', '1 and 3', '2 and 4', '2 and 3', '3 and 4', '1 और 3', '2 और 4', '2 और 3', '3 और 4', 'C', 'Correct Answer: Option C (2 and 3)[cite: 3].

1. Why Assumptions 2 and 3 are valid: The passage directly demonstrates that when relative prices shifted in favour of agriculture by 50%, private investment rose by over 50%, validating Assumption 2[cite: 3]. Building robust value chains for high-value agricultural produce is a necessary structural assumption recognized in this context to sustain agricultural growth and farm wages (Assumption 3)[cite: 3].
2. Why Assumption 1 is invalid: The passage notes that transformation in India was slow compared to China and Vietnam, but does not claim it is "impossible" with small farms[cite: 3].
3. Why Assumption 4 is invalid: Higher global prices triggered growth in 2005-2012, but stating they are permanently "essential" (indispensable) for India''s poverty reduction is an unwarranted extreme assumption[cite: 3].

Therefore, assumptions 2 and 3 are valid[cite: 3].', 'सही उत्तर: विकल्प C (2 और 3)[cite: 3]।

1. पूर्वधारणाएँ 2 और 3 क्यों वैध हैं: परिच्छेद दिखाता है कि जब कीमतें कृषि के पक्ष में 50% बढ़ीं तो निजी निवेश में 50% से अधिक वृद्धि हुई, जो पूर्वधारणा 2 को सिद्ध करता है[cite: 3]। कृषि विकास और आय वृद्धि को टिकाऊ बनाने के लिए उच्च मूल्य उत्पादों की मूल्य-श्रृंखलाओं का निर्माण एक आवश्यक पूर्वधारणा है (पूर्वधारणा 3)[cite: 3]।
2. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद छोटे खेतों के कारण परिवर्तन की गति को ''धीमा'' बताता है, इसे ''असंभव'' नहीं कहता[cite: 3]।
3. पूर्वधारणा 4 क्यों अवैध है: वैश्विक कीमतें 2005-2012 में एक प्रेरक थीं, किन्तु यह मानना कि गरीबी कम करने के लिए उच्च वैश्विक कीमतें ''अनिवार्य'' हैं, एक अतिवादी पूर्वधारणा है[cite: 3]।

अतः पूर्वधारणाएँ 2 और 3 वैध हैं[cite: 3]।', NULL),
    ('csat-2020-q27', 27, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Institutional Support for Small Farmers', 'लघु किसानों के संस्थागत समर्थन पर महत्वपूर्ण संदेश', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Smallholder Agriculture', 'Farmer Support']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In India, agriculture still engages about half of its workforce, and about 85 per cent of its farms are small and marginal. Compared to China and Vietnam, which have experienced fast structural and rural transformation, India''s story is of slow transformation. As a result, poverty reduction in India was at a much slower pace during 1988-2014, compared to China and Vietnam. India''s poverty reduction was slow during 1988-2005, but during 2005-2012, it accelerated dramatically-almost three times faster than during the earlier period. What did India do during this period? Research reveals that the relative price scenario changed significantly (by more than 50%) in favour of agriculture in the wake of rising global prices. This boosted private investments in agriculture by more than 50%. As a result, agri-GDP growth touched 4.1% during 2007-2012 as against 2.4% during 2002-2007. The net surplus of agri-trade touched $25 billion in 2013-2014; real farm wages rose by 7% per annum. All this led to unprecedented fall in poverty.

Which one of the following statements best reflects the critical message of the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में, अभी भी लगभग पचास प्रतिशत कामगार कृषि में विनियोजित हैं, तथा लगभग 85 प्रतिशत खेत छोटे और सीमांत हैं। चीन और वियतनाम की तुलना में, जहाँ तेज़ गति से संरचनात्मक और ग्रामीण परिवर्तन हुए, भारत की कहानी धीमे परिवर्तन की है। परिणामस्वरूप भारत में गरीबी-ह्रास, चीन और वियतनाम की तुलना में, 1988-2014 के बीच बहुत धीमी गति का था। भारत का गरीबी-ह्रास 1988-2005 के बीच धीमा था, परंतु 2005-2012 के दौरान यह नाटकीय गति से बढ़ा-पूर्व के काल की तुलना में तीन गुना तेज़ गति से। इस काल में भारत ने क्या किया ? शोध से पता चलता है कि सापेक्ष कीमतों का दृश्यलेख, बढ़ती वैश्विक कीमतों के परिणामस्वरूप, कृषि के पक्ष में महत्त्वपूर्ण ढंग से परिवर्तित हुआ है (50% से भी अधिक)। इससे कृषि में निजी निवेश 50% से भी अधिक बढ़ा। परिणामस्वरूप, कृषि-जी० डी० पी० की वृद्धि ने 2002-2007 के 2.4% के मुकाबले 2007-2012 में 4.1% के स्तर को छुआ। कृषि-व्यापार के निवल अधिशेष ने 2013-2014 में $25 बिलियन के स्तर को छुआ; वास्तविक कृषि मज़दूरी 7% प्रति वर्ष की दर से बढ़ी। इन सबके कारण गरीबी में अभूतपूर्व गिरावट आई।

निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'India should create large-scale off-farm rural employment to reduce poverty in the near future.', 'India should create a large number of farmer producer companies.', 'Private investment in agriculture should be given priority over public investment.', 'Inclusive agricultural growth is key to reduce poverty in the near future.', 'निकट भविष्य में भारत की गरीबी कम करने के लिए बड़े पैमाने पर कृषीतर ग्रामीण रोज़गार सृजित करना चाहिए।', 'भारत को बड़े पैमाने पर कृषक उत्पाद कंपनियाँ सृजित करनी चाहिए।', 'कृषि में लोक निवेश की तुलना में निजी निवेश को प्राथमिकता देनी चाहिए।', 'निकट भविष्य में गरीबी कम करने के लिए समावेशी कृषि विकास मुख्य समाधान है।', 'D', 'Correct Answer: Option D (Inclusive agricultural growth is key to reduce poverty in the near future)[cite: 3].

1. Why Option D is correct: The passage emphasizes that because half of India''s workforce depends on agriculture and 85% are small/marginal farmers, accelerating agricultural growth and real farm wages directly triggered an unprecedented fall in poverty[cite: 3].
2. Why Option A is incorrect: The passage focuses on revitalizing agriculture directly rather than creating off-farm employment[cite: 3].
3. Why Option B is incorrect: Farmer producer companies are not discussed in the text[cite: 3].
4. Why Option C is incorrect: The passage notes that private investment surged, but does not prescribe prioritizing private investment over public investment[cite: 3].

Therefore, option D best reflects the critical message[cite: 3].', 'सही उत्तर: विकल्प D (निकट भविष्य में गरीबी कम करने के लिए समावेशी कृषि विकास मुख्य समाधान है)[cite: 3]।

1. विकल्प D क्यों सही है: परिच्छेद दर्शाता है कि भारत की 50% कार्यबल कृषि पर निर्भर है और जब कृषि विकास दर बढ़ी व कृषि मज़दूरी में 7% की वार्षिक वृद्धि हुई, तो गरीबी में भारी कमी आई; अतः समावेशी कृषि विकास ही गरीबी उन्मूलन की कुंजी है[cite: 3]।
2. विकल्प A क्यों गलत है: परिच्छेद का जोर कृषि क्षेत्र के भीतर सुधार पर है, कृषीतर (off-farm) रोज़गार पर नहीं[cite: 3]।
3. विकल्प B क्यों गलत है: कृषक उत्पादक कंपनियों का परिच्छेद में कोई उल्लेख नहीं है[cite: 3]।
4. विकल्प C क्यों गलत है: परिच्छेद निजी निवेश की वृद्धि को दर्शाता है, किन्तु लोक निवेश के ऊपर इसे प्राथमिकता देने की वकालत नहीं करता[cite: 3]।

अतः विकल्प D क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है[cite: 3]।', NULL),
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
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'C', 'Correct Answer: Option C (S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question)[cite: 3].

1. From S1 alone: $R > P$ and $R > Q$. However, we have no information about $S$, so $S$ could be the largest. Hence, S1 alone is insufficient[cite: 3].
2. From S2 alone: $S$ is not the largest, but no relationship among $P, Q,$ and $R$ is provided. Hence, S2 alone is insufficient[cite: 3].
3. Combining S1 and S2: From S1, neither $P$ nor $Q$ can be the largest since $R$ is greater than both. From S2, $S$ cannot be the largest. Therefore, $R$ must be the largest number among $P, Q, R,$ and $S$[cite: 3].

Therefore, S1 and S2 together are sufficient to answer the Question[cite: 3].', 'सही उत्तर: विकल्प C (दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है)[cite: 3]।

1. केवल S1 से: $R > P$ तथा $R > Q$ है, किन्तु $S$ का मान $R$ से बड़ा हो सकता है, अतः S1 अकेला अपर्याप्त है[cite: 3]।
2. केवल S2 से: $S$ सबसे बड़ा नहीं है, किन्तु $P, Q, R$ में तुलना उपलब्ध नहीं है, अतः S2 अकेला अपर्याप्त है[cite: 3]।
3. S1 और S2 को मिलाने पर: $P$ और $Q$ सबसे बड़े नहीं हो सकते (क्योंकि $R$ उनसे बड़ा है) और $S$ भी सबसे बड़ा नहीं है। अतः चारों में सबसे बड़ी संख्या अनिवार्य रूप से $R$ होगी[cite: 3]।

अतः दोनों कथन मिलकर प्रश्न का उत्तर देने के लिए पर्याप्त हैं[cite: 3]।', NULL),
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
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'D', 'Correct Answer: Option D (S1 and S2 together are not sufficient to answer the Question)[cite: 3].

1. Natural numbers strictly between 10 and 20 are $\{11, 12, 13, 14, 15, 16, 17, 18, 19\}$[cite: 3].
2. From S1 (prime numbers): $n \in \{11, 13, 17, 19\}$ (multiple values, insufficient)[cite: 3].
3. From S2 ($n \equiv 1 \pmod 4$): $n \in \{13, 17\}$ (multiple values, insufficient)[cite: 3].
4. Combining S1 and S2: The set of prime numbers between 10 and 20 that leave remainder 1 when divided by 4 contains both $13$ ($4 \times 3 + 1$) and $17$ ($4 \times 4 + 1$). Since a unique value for $n$ cannot be determined, the statements together are insufficient[cite: 3].

Therefore, S1 and S2 together are not sufficient to answer the Question[cite: 3].', 'सही उत्तर: विकल्प D (S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं)[cite: 3]।

1. 10 और 20 के बीच की संख्याएँ: $\{11, 12, 13, 14, 15, 16, 17, 18, 19\}$[cite: 3]।
2. कथन S1 से (अभाज्य संख्याएँ): $n \in \{11, 13, 17, 19\}$ (अपर्याप्त)[cite: 3]।
3. कथन S2 से ($n$ को 4 से भाग देने पर 1 शेष): $n \in \{13, 17\}$ (अपर्याप्त)[cite: 3]।
4. S1 और S2 दोनों को मिलाने पर: $n$ अभाज्य भी है और $4k+1$ के रूप में भी है। 13 और 17 दोनों संख्याएँ इन दोनों शर्तों को पूरा करती हैं। चूँकि $n$ का कोई अद्वितीय मान नहीं मिलता, अतः दोनों कथन मिलकर भी पर्याप्त नहीं हैं[cite: 3]।

अतः S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं[cite: 3]।', NULL),
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
निम्नलिखित में से कौन-सा उपर्युक्त कथनों और प्रश्न के लिए सही है?', 'S1 alone is sufficient to answer the Question.', 'S2 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question.', 'S1 and S2 together are not sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S2 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त नहीं हैं।', 'C', 'Correct Answer: Option C (S1 and S2 together are sufficient to answer the Question, but neither S1 alone nor S2 alone is sufficient to answer the Question)[cite: 3].

1. Let the two numbers be $x$ and $y$.
2. From S1: $xy = 21$ (infinite real number pairs or pairs like $1, 21$ and $3, 7$; insufficient)[cite: 3].
3. From S2: $x + y = 10$ (infinite pairs; insufficient)[cite: 3].
4. Combining S1 and S2 gives the quadratic equation: $t^2 - (x+y)t + xy = 0 \implies t^2 - 10t + 21 = 0 \implies (t - 3)(t - 7) = 0$. The roots uniquely identify the set of numbers as $\{3, 7\}$[cite: 3].

Therefore, S1 and S2 together are sufficient to answer the Question[cite: 3].', 'सही उत्तर: विकल्प C (दोनों कथन S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं किन्तु न तो अकेला S1 और न ही अकेला S2 प्रश्न का उत्तर देने के लिए पर्याप्त है)[cite: 3]।

1. माना दो संख्याएँ $x$ और $y$ हैं।
2. कथन S1 से: $xy = 21$ (अकेले अपर्याप्त)[cite: 3]।
3. कथन S2 से: $x + y = 10$ (अकेले अपर्याप्त)[cite: 3]।
4. दोनों कथनों को मिलाने पर द्विघात समीकरण $t^2 - 10t + 21 = 0$ बनता है, जिससे $(t-3)(t-7)=0$ प्राप्त होता है। इससे दोनों संख्याएँ विशिष्ट रूप से 3 और 7 निश्चित हो जाती हैं[cite: 3]।

अतः S1 और S2 मिलकर प्रश्न का उत्तर देने के लिए पर्याप्त हैं[cite: 3]।', NULL),
    ('csat-2020-q31', 31, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Direction Sense Test & Spatial Navigation', 'दिशा ज्ञान परीक्षण एवं स्थानिक संचलन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Direction Sense', 'Spatial Logic']::TEXT[], 'A man walks down the backside of his house straight 25 metres, then turns to the right and walks 50 metres again; then he turns towards left and again walks 25 metres. If his house faces to the East, what is his direction from the starting point?', 'एक व्यक्ति अपने घर के पीछे से सीधे 25 मीटर चलता है, फिर वह दाहिने मुड़कर 50 मीटर और चलता है; फिर वह बाएँ मुड़कर पुनः 25 मीटर चलता है। यदि उसके घर का मुख पूर्व की ओर है, तो वह अपने प्रारंभिक बिंदु से किस दिशा में है?', 'South-East', 'South-West', 'North-East', 'North-West', 'दक्षिण-पूर्व', 'दक्षिण-पश्चिम', 'उत्तर-पूर्व', 'उत्तर-पश्चिम', 'D', 'Correct Answer: Option D (North-West)[cite: 3].

1. House faces East $\implies$ walking straight out of the backside means walking towards the **West**[cite: 3].
2. First movement: $25\text{ m}$ West $\implies$ position $(-25, 0)$[cite: 3].
3. Second movement: Turns right (facing West, right turn is **North**) and walks $50\text{ m} \implies$ position $(-25, 50)$[cite: 3].
4. Third movement: Turns left (facing North, left turn is **West**) and walks $25\text{ m} \implies$ final position $(-50, 50)$[cite: 3].
5. From the origin $(0,0)$, the point $(-50, 50)$ lies in the **North-West** quadrant[cite: 3].

Therefore, his direction from the starting point is North-West[cite: 3].', 'सही उत्तर: विकल्प D (उत्तर-पश्चिम)[cite: 3]।

1. घर का मुख पूर्व की ओर है, अतः घर के पीछे से चलने का अर्थ है **पश्चिम** दिशा में आगे बढ़ना[cite: 3]।
2. पहली गति: पश्चिम में 25 मीटर $\implies$ स्थिति $(-25, 0)$[cite: 3]।
3. दूसरी गति: दाहिने मुड़ना (पश्चिम दिशा में दाहिना मोड़ **उत्तर** होगा) और 50 मीटर चलना $\implies$ स्थिति $(-25, 50)$[cite: 3]।
4. तीसरी गति: बाएँ मुड़ना (उत्तर दिशा में बायाँ मोड़ **पश्चिम** होगा) और 25 मीटर चलना $\implies$ अंतिम स्थिति $(-50, 50)$[cite: 3]।
5. प्रारंभिक बिंदु $(0, 0)$ से बिंदु $(-50, 50)$ **उत्तर-पश्चिम** दिशा में है[cite: 3]।

अतः वह अपने प्रारंभिक बिंदु से उत्तर-पश्चिम दिशा में है[cite: 3]।', NULL),
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
ऊपर लिखे हुए निष्कर्षों में से कौन-सा/से दिए गए दो कथनों से तार्किक रूप से निकाला/निकाले जा सकता/सकते है/हैं?', 'Only Conclusion-I', 'Only Conclusion-II', 'Neither Conclusion-I nor Conclusion-II', 'Both Conclusion-I and Conclusion-II', 'केवल निष्कर्ष-I', 'केवल निष्कर्ष-II', 'न तो निष्कर्ष-I, न ही निष्कर्ष-II', 'दोनों निष्कर्ष-I और निष्कर्ष-II', 'A', 'Correct Answer: Option A (Only Conclusion-I)[cite: 3].

1. If a number is divisible by 2 and also divisible by 3, by the properties of coprime numbers it must be divisible by $2 \times 3 = 6$. Thus, Conclusion-I logically follows[cite: 3].
2. Divisibility by 2 does not imply divisibility by 4 (for example, 6 is divisible by 2 and 3, but not divisible by 4). Thus, Conclusion-II does not follow[cite: 3].

Therefore, only Conclusion-I logically follows[cite: 3].', 'सही उत्तर: विकल्प A (केवल निष्कर्ष-I)[cite: 3]।

1. यदि कोई संख्या 2 और 3 दोनों से विभाज्य है, तो वह उनके गुणनफल $2 \times 3 = 6$ से भी अनिवार्य रूप से विभाज्य होगी। अतः निष्कर्ष-I तार्किक रूप से निकलता है[cite: 3]।
2. 2 से विभाज्य संख्या 4 से भी विभाज्य हो यह आवश्यक नहीं है (जैसे 6, जो 2 और 3 से विभाज्य है किन्तु 4 से नहीं)। अतः निष्कर्ष-II नहीं निकलता[cite: 3]।

अतः केवल निष्कर्ष-I सही है[cite: 3]।', NULL),
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
सामान्य ज्ञात तथ्यों की उपेक्षा करते हुए, ऊपर लिखे हुए निष्कर्षों में से कौन-सा/से दिए गए दो कथनों से तार्किक रूप से निकाला/निकाले जा सकता/सकते है/हैं?', 'Only Conclusion-I', 'Only Conclusion-II', 'Neither Conclusion-I nor Conclusion-II', 'Both Conclusion-I and Conclusion-II', 'केवल निष्कर्ष-I', 'केवल निष्कर्ष-II', 'न तो निष्कर्ष-I, न ही निष्कर्ष-II', 'दोनों निष्कर्ष-I और निष्कर्ष-II', 'C', 'Correct Answer: Option C (Neither Conclusion-I nor Conclusion-II)[cite: 3].

1. From "All cats are dogs" and "All cats are black", we can only deduce the particular intersection: "Some dogs are black" (specifically, those dogs that are cats)[cite: 3].
2. Conclusion-I ("All dogs are black") does not follow because there may be dogs outside the cat subset that are not black[cite: 3].
3. Conclusion-II ("Some dogs are not black") is also not necessarily guaranteed because all dogs could potentially be black[cite: 3].

Therefore, neither Conclusion-I nor Conclusion-II logically follows[cite: 3].', 'सही उत्तर: विकल्प C (न तो निष्कर्ष-I, न ही निष्कर्ष-II)[cite: 3]।

1. "सभी बिल्लियाँ कुत्ते हैं" और "सभी बिल्लियाँ काली हैं" से केवल यह निश्चित निष्कर्ष निकलता है कि "कुछ कुत्ते काले हैं" (जो बिल्लियाँ हैं)[cite: 3]।
2. निष्कर्ष-I ("सभी कुत्ते काले हैं") निश्चित नहीं है क्योंकि बिल्लियों के अलावा अन्य कुत्ते किसी अन्य रंग के हो सकते हैं[cite: 3]।
3. निष्कर्ष-II ("कुछ कुत्ते काले नहीं हैं") भी निश्चित रूप से सत्य नहीं है क्योंकि संभव है कि सभी कुत्ते काले हों[cite: 3]।

अतः न तो निष्कर्ष-I और न ही निष्कर्ष-II निकलता है[cite: 3]।', NULL),
    ('csat-2020-q34', 34, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Conditional Odd-Even Sequence Counting', 'प्रतिबंधित सम-विषम अनुक्रम गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Number Sequence', 'Pattern Recognition']::TEXT[], 'Consider the following sequence of numbers:
$$5\ 1\ 4\ 7\ 3\ 9\ 8\ 5\ 7\ 2\ 6\ 3\ 1\ 5\ 8\ 6\ 3\ 8\ 5\ 2\ 2\ 4\ 3\ 4\ 9\ 6$$
How many odd numbers are followed by the odd number in the above sequence?', 'निम्नलिखित संख्याओं के अनुक्रम पर विचार कीजिए:
$$5\ 1\ 4\ 7\ 3\ 9\ 8\ 5\ 7\ 2\ 6\ 3\ 1\ 5\ 8\ 6\ 3\ 8\ 5\ 2\ 2\ 4\ 3\ 4\ 9\ 6$$
ऊपर लिखे हुए अनुक्रम में कितनी विषम संख्याओं के बाद विषम संख्या आती है?', '5', '6', '7', '8', '5', '6', '7', '8', 'B', 'Correct Answer: Option B (6)[cite: 3].

1. Identify every instance where an odd number is immediately followed by an odd number in the sequence:
   * **(5, 1)** $\rightarrow$ 5 is odd, followed by 1 (odd) [1]
   * **(7, 3)** $\rightarrow$ 7 is odd, followed by 3 (odd) [2]
   * **(3, 9)** $\rightarrow$ 3 is odd, followed by 9 (odd) [3]
   * **(5, 7)** $\rightarrow$ 5 is odd, followed by 7 (odd) [4]
   * **(3, 1)** $\rightarrow$ 3 is odd, followed by 1 (odd) [5]
   * **(1, 5)** $\rightarrow$ 1 is odd, followed by 5 (odd) [6]
2. Count $= 6$.

Therefore, there are 6 such odd numbers[cite: 3].', 'सही उत्तर: विकल्प B (6)[cite: 3]।

1. अनुक्रम में विषम संख्या के तुरंत बाद विषम संख्या आने वाले युग्मों की पहचान:
   * **(5, 1)** $\rightarrow$ 5 के बाद 1 [1]
   * **(7, 3)** $\rightarrow$ 7 के बाद 3 [2]
   * **(3, 9)** $\rightarrow$ 3 के बाद 9 [3]
   * **(5, 7)** $\rightarrow$ 5 के बाद 7 [4]
   * **(3, 1)** $\rightarrow$ 3 के बाद 1 [5]
   * **(1, 5)** $\rightarrow$ 1 के बाद 5 [6]
2. कुल संख्या $= 6$।

अतः ऐसे विषम अंकों की संख्या 6 है[cite: 3]।', NULL),
    ('csat-2020-q35', 35, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Linear Order, Ranking & Left-Right Position Shifting', 'रैखिक क्रम व्यवस्था, रैंकिंग एवं स्थिति परिवर्तन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Order and Ranking', 'Linear Arrangement']::TEXT[], 'A is 16th from the left end in a row of boys and V is 18th from the right end. G is 11th from A towards the right and 3rd from V towards the right end. How many boys are there in the row?', 'लड़कों की एक पंक्ति में A बाएँ छोर से 16वें स्थान पर और V दाएँ छोर से 18वें स्थान पर है। G, A की दाईं ओर 11वें और V से तीसरे स्थान पर दाहिने छोर की ओर है। पंक्ति में कितने लड़के हैं?', '40', '41', '42', 'Cannot be determined due to insufficient data', '40', '41', '42', 'अपर्याप्त आँकड़ों के कारण निर्धारित नहीं किया जा सकता है', 'B', 'Correct Answer: Option B (41)[cite: 3].

1. Position of A from the left end $= 16$[cite: 3].
2. G is 11th to the right of A $\implies$ Position of G from the left end $= 16 + 11 = 27$[cite: 3].
3. V is 18th from the right end. G is 3rd from V towards the right end $\implies$ Position of G from the right end $= 18 - 3 = 15$[cite: 3].
4. Total boys in the row $= (\text{Left position of G}) + (\text{Right position of G}) - 1 = 27 + 15 - 1 = 41$[cite: 3].

Therefore, there are 41 boys in the row[cite: 3].', 'सही उत्तर: विकल्प B (41)[cite: 3]।

1. बाएँ छोर से A का स्थान $= 16$वाँ[cite: 3]।
2. G, A के दाईं ओर 11वें स्थान पर है $\implies$ बाएँ छोर से G का स्थान $= 16 + 11 = 27$वाँ[cite: 3]।
3. दाएँ छोर से V का स्थान $= 18$वाँ। G, V से 3 स्थान दाएँ छोर की ओर है $\implies$ दाएँ छोर से G का स्थान $= 18 - 3 = 15$वाँ[cite: 3]।
4. पंक्ति में लड़कों की कुल संख्या $= 27 + 15 - 1 = 41$[cite: 3]।

अतः पंक्ति में कुल 41 लड़के हैं[cite: 3]।', NULL),
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
निम्नलिखित में से कौन-सा ऊपर लिखे हुए कथनों और प्रश्न के संदर्भ में सही है?', 'S1 alone is sufficient to answer the Question.', 'S1 and S2 together are sufficient to answer the Question.', 'S2 and S3 together are sufficient to answer the Question.', 'S1 and S3 together are sufficient to answer the Question.', 'S1 अकेले ही प्रश्न का उत्तर देने के लिए पर्याप्त है।', 'S1 और S2 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'S2 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'S1 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं।', 'D', 'Correct Answer: Option D (S1 and S3 together are sufficient to answer the Question)[cite: 3].

1. From S1: $D > C > A$ and $D > C > B$ (both $A$ and $B$ are younger than $C$ and $D$)[cite: 3].
2. From S3: $A > B$[cite: 3].
3. Combining S1 and S3 establishes the complete order: $D > C > A > B$, uniquely identifying $B$ as the youngest[cite: 3].

Therefore, S1 and S3 together are sufficient to answer the Question[cite: 3].', 'सही उत्तर: विकल्प D (S1 और S3 एकसाथ प्रश्न का उत्तर देने के लिए पर्याप्त हैं)[cite: 3]।

1. कथन S1 से: $D > C > A$ तथा $D > C > B$[cite: 3]।
2. कथन S3 से: $A > B$[cite: 3]।
3. S1 और S3 को मिलाने पर पूर्ण क्रम $D > C > A > B$ प्राप्त होता है, जिससे $B$ सबसे छोटा सिद्ध होता है[cite: 3]।

अतः S1 और S3 मिलकर उत्तर देने के लिए पर्याप्त हैं[cite: 3]।', NULL),
    ('csat-2020-q37', 37, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Inclusion Counting & Divisibility Exclusion', 'अंक समावेश गणना एवं विभाज्यता अपवर्जन', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Digit Counting', 'Divisibility by 4']::TEXT[], 'How many integers are there between 1 and 100 which have 4 as a digit but are not divisible by 4?', '1 और 100 के मध्य कितनी ऐसी पूर्ण संख्याएँ हैं जिनमें एक अंक 4 है लेकिन वे 4 से विभाज्य नहीं हैं?', '5', '11', '12', '13', '5', '11', '12', '13', 'C', 'Correct Answer: Option C (12)[cite: 3].

1. List all 19 numbers between 1 and 100 containing the digit 4: $\{4, 14, 24, 34, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 54, 64, 74, 84, 94\}$[cite: 3].
2. Numbers from this set that are divisible by 4: $\{4, 24, 40, 44, 48, 64, 84\}$ (7 numbers)[cite: 3].
3. Numbers containing 4 but NOT divisible by 4: $\{14, 34, 41, 42, 43, 45, 46, 47, 49, 54, 74, 94\}$ ($19 - 7 = 12$ numbers)[cite: 3].

Therefore, there are 12 such integers[cite: 3].', 'सही उत्तर: विकल्प C (12)[cite: 3]।

1. 1 और 100 के मध्य अंक 4 वाली कुल 19 संख्याएँ हैं: $\{4, 14, 24, 34, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 54, 64, 74, 84, 94\}$[cite: 3]।
2. इनमें से 4 से विभाज्य संख्याएँ: $\{4, 24, 40, 44, 48, 64, 84\}$ (कुल 7 संख्याएँ)[cite: 3]।
3. 4 अंक वाली किन्तु 4 से अविभाज्य संख्याएँ: $19 - 7 = 12$ संख्याएँ[cite: 3]।

अतः ऐसी कुल 12 संख्याएँ हैं[cite: 3]।', NULL),
    ('csat-2020-q38', 38, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', '3D Solid Cube Volume Ratios & Density Equations', '3D ठोस घन आयतन अनुपात एवं घनत्व समीकरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Mensuration & Geometry', 'Cubes', 'Volume & Density']::TEXT[], 'Let x, y be the volumes; m, n be the masses of two metallic cubes P and Q respectively. Each side of Q is two times that of P and mass of Q is two times that of P. Let u = m/x and v = n/y. Which one of the following is correct?', 'माना कि दो धातु के घनों P और Q के क्रमशः x, y आयतन हैं; m, n द्रव्यमान हैं। Q की प्रत्येक भुजा P की दोगुनी है और Q का द्रव्यमान P का दोगुना है। माना कि u = m/x और v = n/y है। निम्नलिखित में से कौन-सा सही है?', 'u = 4v', 'u = 2v', 'v = u', 'v = 4u', 'u = 4v', 'u = 2v', 'v = u', 'v = 4u', 'A', 'Correct Answer: Option A (u = 4v)[cite: 3].

1. Let the side of cube P be $a \implies$ volume $x = a^3$[cite: 3].
2. The side of cube Q is $2a \implies$ volume $y = (2a)^3 = 8a^3 = 8x$[cite: 3].
3. Mass of P is $m$, mass of Q is $n = 2m$[cite: 3].
4. Ratios: $u = \frac{m}{x}$ and $v = \frac{n}{y} = \frac{2m}{8x} = \frac{1}{4} \left(\frac{m}{x}\right) = \frac{u}{4} \implies u = 4v$[cite: 3].

Therefore, $u = 4v$ is correct[cite: 3].', 'सही उत्तर: विकल्प A (u = 4v)[cite: 3]।

1. माना घन P की भुजा $a \implies$ आयतन $x = a^3$[cite: 3]।
2. घन Q की भुजा $2a \implies$ आयतन $y = (2a)^3 = 8a^3 = 8x$[cite: 3]।
3. P का द्रव्यमान $m$ तथा Q का द्रव्यमान $n = 2m$[cite: 3]।
4. $u = \frac{m}{x}$ और $v = \frac{n}{y} = \frac{2m}{8x} = \frac{u}{4} \implies u = 4v$[cite: 3]।

अतः $u = 4v$ सही उत्तर है[cite: 3]।', NULL),
    ('csat-2020-q39', 39, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Average Age Calculation & Multi-Variable Age System', 'औसत आयु गणना एवं बहु-चर आयु प्रणाली', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Age Problems']::TEXT[], 'The average age of a teacher and three students is 20 years. If all the three students are of same age and the difference between the age of the teacher and each student is 20 years, then what is the age of the teacher?', 'एक शिक्षक और तीन छात्रों की औसत आयु 20 वर्ष है। यदि तीनों छात्र समान आयु के हों और शिक्षक तथा प्रत्येक छात्र की आयु का अंतर 20 वर्ष हो, तो शिक्षक की आयु कितनी है?', '25 years', '30 years', '35 years', '45 years', '25 वर्ष', '30 वर्ष', '35 वर्ष', '45 वर्ष', 'C', 'Correct Answer: Option C (35 years)[cite: 3].

1. Let $T$ be the teacher''s age and $S$ be each student''s age[cite: 3].
2. Total age sum: $T + 3S = 4 \times 20 = 80$[cite: 3].
3. Age difference: $T - S = 20 \implies S = T - 20$[cite: 3].
4. Substitute: $T + 3(T - 20) = 80 \implies 4T - 60 = 80 \implies 4T = 140 \implies T = 35$[cite: 3].

Therefore, the age of the teacher is 35 years[cite: 3].', 'सही उत्तर: विकल्प C (35 वर्ष)[cite: 3]।

1. माना शिक्षक की आयु $T$ वर्ष और प्रत्येक छात्र की आयु $S$ वर्ष है[cite: 3]।
2. कुल आयु: $T + 3S = 4 \times 20 = 80$[cite: 3]।
3. आयु अंतर: $T - S = 20 \implies S = T - 20$[cite: 3]।
4. मान रखने पर: $T + 3(T - 20) = 80 \implies 4T = 140 \implies T = 35$ वर्ष[cite: 3]।

अतः शिक्षक की आयु 35 वर्ष है[cite: 3]।', NULL),
    ('csat-2020-q40', 40, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Cost Price, Selling Price & Loss Percentage Calculation', 'क्रय मूल्य, विक्रय मूल्य एवं हानि प्रतिशत गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Profit and Loss', 'Commercial Math']::TEXT[], 'A person bought a car and sold it for ₹3,00,000. If he incurred a loss of 20%, then how much did he spend to buy the car?', 'एक व्यक्ति ने एक कार खरीदी और ₹3,00,000 में बेच दी। यदि उसे 20% की हानि उठानी पड़ी, तो उसने कार खरीदने में कितने रुपये खर्च किए ?', '3,60,000', '3,65,000', '3,70,000', '3,75,000', '3,60,000', '3,65,000', '3,70,000', '3,75,000', 'D', 'Correct Answer: Option D (3,75,000)[cite: 3].

1. Let the cost price be $C$[cite: 3].
2. Selling price after 20% loss: $0.80 C = 3,00,000$[cite: 3].
3. $C = \frac{3,00,000}{0.80} = 3,75,000$[cite: 3].

Therefore, he spent ₹3,75,000 to buy the car[cite: 3].', 'सही उत्तर: विकल्प D (3,75,000)[cite: 3]।

1. माना क्रय मूल्य $C$ है[cite: 3]।
2. 20% हानि पर विक्रय मूल्य: $0.80 C = 3,00,000$[cite: 3]।
3. $C = \frac{3,00,000}{0.80} = 3,75,000$ रुपये[cite: 3]।

अतः उसने कार खरीदने में ₹3,75,000 खर्च किए[cite: 3]।', NULL),
    ('csat-2020-q41', 41, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Groundwater Depletion & Irrigation Management', 'भूजल ह्रास एवं सिंचाई प्रबंधन पर महत्वपूर्ण संदेश', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Groundwater', 'Water Policy']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Spanish ships in the late 16th century first brought the potato tuber from South America to Europe whereby in the early 19th century, it had become a reliable backup to cereal crops, particularly in the cold, rain-soaked soils of Ireland. The Irish were soon almost wholly dependent on the potato as their staple food. And they were planting primarily one prodigious variety, the ''Lumper'' potato, whose genetic frailty would be cruelly exposed by the fungus ''Phytophthora infestans''. In 1845, spores of the deadly fungus began spreading across the country, destroying nearly all the Lumpers in its path. The resulting famine killed or displaced millions.

Which one of the following statements best reflects the critical message of the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
स्पैनिश जहाज 16वीं शताब्दी के उत्तरार्ध में पहली बार दक्षिण अमेरिका से आलू कंद यूरोप लाए, जिससे कि प्रारंभिक 19वीं शताब्दी में यह विशेषकर ठंडे आयरलैंड की वर्षा से तर भूमि में धान्य फसलों का विश्वसनीय पूर्तिकर हो गया। आयरलैंड-वासी शीघ्र ही लगभग पूर्णतः प्रधान खाद्य के रूप में आलू पर निर्भर हो गए। और वे मुख्य रूप से उसकी एक बृहदाकार किस्म, ''लम्पर'' आलू को उगाने लगे, जिसकी आनुवंशिक भंगुरता को एक कवक ''फाइटोफ्थोरा इन्फेस्टेन्स (Phytophthora infestans)'' ने आने वाले समय में निर्ममता से अनावृत कर दिया। 1845 में इस घातक कवक के बीजाणुओं ने समूचे देश में फैलना आरम्भ कर दिया और अपने पथ में आने वाले लगभग सभी लम्परों को नष्ट कर दिया। इसके परिणामस्वरूप हुए अकाल ने कई मिलियन लोगों को मार दिया या विस्थापित किया।

निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'For introducing any foreign plant into a country, the soil and climate conditions of that country should be suitable.', 'As a staple food of a country, tuber crops like potato cannot replace cereal crops.', 'Some of the fungal infections of plants cannot be prevented or stopped from spreading across large areas.', 'Relying on a homogeneous food source is not desirable.', 'किसी विदेशी पादप को किसी देश में समाविष्ट करने के लिए उस देश की भूमि और जलवायु दशाएँ उपयुक्त होनी चाहिए।', 'किसी देश के प्रधान खाद्य के रूप में आलू जैसी कंद वाली फसलें, धान्य फसलों का स्थान नहीं ले सकतीं।', 'पादपों के कुछ कवक संक्रमणों को बड़े क्षेत्रों में फैलने से बाधित किया या रोका नहीं जा सकता।', 'किसी समांगी खाद्य स्रोत पर निर्भर होना वांछनीय नहीं है।', 'D', 'Correct Answer: Option D (Relying on a homogeneous food source is not desirable).

1. Why Option D is correct: The passage highlights how the Irish population''s near-total reliance on a single, genetically uniform potato variety (''Lumper'') resulted in catastrophe when a fungal blight wiped out the entire crop, leading to mass starvation. This demonstrates the critical danger of monoculture and relying on a homogeneous food source.
2. Why Option A is incorrect: The passage mentions that potatoes grew very reliably in Ireland''s cold, wet soil; climate/soil incompatibility was not the issue that caused the famine.
3. Why Option B is incorrect: The passage shows that the potato successfully served as a staple food for decades; the collapse was due to genetic uniformity and disease, not because tuber crops are inherently incapable of serving as staples.
4. Why Option C is incorrect: The main takeaway is the risk of extreme genetic vulnerability through monoculture, not an assertion about the unstoppable nature of fungal pathogens in general.

Therefore, relying on a homogeneous food source is not desirable best reflects the critical message.', 'सही उत्तर: विकल्प D (किसी समांगी खाद्य स्रोत पर निर्भर होना वांछनीय नहीं है)।

1. विकल्प D क्यों सही है: परिच्छेद स्पष्ट रूप से दर्शाता है कि आयरलैंड के लोग लगभग पूरी तरह से आलू की केवल एक ही आनुवंशिक किस्म (''लम्पर'') पर निर्भर हो गए थे। जब फफूंद का संक्रमण फैला, तो इस आनुवंशिक एकरूपता (समांगता) के कारण पूरी फसल नष्ट हो गई और भीषण अकाल पड़ा। यह साबित करता है कि किसी समांगी खाद्य स्रोत पर निर्भर होना अवांछनीय और जोखिम भरा है।
2. विकल्प A क्यों गलत है: परिच्छेद के अनुसार आयरलैंड की भूमि और जलवायु आलू के लिए बहुत उपयुक्त थी और यह धान्य फसलों का विश्वसनीय विकल्प बन गया था; अकाल का कारण जलवायु की अनुपयुक्तता नहीं थी।
3. विकल्प B क्यों गलत है: परिच्छेद यह नहीं कहता कि कंद फसलें प्रधान खाद्य नहीं बन सकतीं; समस्या आलू का कंद होना नहीं बल्कि केवल एक ही किस्म पर अत्यधिक निर्भरता थी।
4. विकल्प C क्यों गलत है: परिच्छेद का मुख्य उद्देश्य कवक संक्रमण के प्रसार की अनिवार्यता बताना नहीं, बल्कि एकल-फसल (मोनोकल्चर) के खतरों को उजागर करना है।

अतः किसी समांगी खाद्य स्रोत पर निर्भर होना वांछनीय नहीं है क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है।', NULL),
    ('csat-2020-q42', 42, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Practical Implications for Water Pricing & Crop Pattern Shifting', 'जल मूल्य निर्धारण एवं फसल चक्र बदलाव के व्यावहारिक निहितार्थ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Irrigation Policy', 'Crop Diversification']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India is at once among the fastest growing global economies and home to the largest number of malnourished children in the world. There are regions where malnutrition is not the exception but the norm. And across the country, malnutrition is the cause of death for roughly half the 1.3 million children who die before their fifth birthday each year. Even those children who survive suffer permanently from the damage that has already been done to their bodies and minds from not getting enough of the right foods and nutrients. Around 44 million children under 5 are stunted. That makes it harder for them to learn in school and subsequently earn a living as adults. Their lifetime earnings potential is almost a quarter less than that of their healthy peers.

With reference to the above passage, which of the following is/are the most rational and practical implication/implications?
1. India''s Public Distribution System should be monitored by the Union Government.
2. Girls should be encouraged to delay marriage and first pregnancy.
3. Mothers should be encouraged to breastfeed their children immediately after birth.
4. The supply of safe drinking water and proper sanitation facilities to all should be ensured.
5. Authorities should ensure the vaccination as prescribed.
Select the correct answer using the code given below.', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत सबसे तीव्र विकसित होने वाली वैश्विक अर्थव्यवस्थाओं में से है, फिर भी यह विश्व में सबसे अधिक कुपोषित बच्चों का घर है। ऐसे भी क्षेत्र हैं जहाँ कुपोषण अपवाद नहीं अपितु सामान्य है। और सारे देश में, हर वर्ष अपना पाँचवाँ जन्मदिन मनाने से पूर्व मरने वाले 1-3 मिलियन बच्चों में से लगभग आधे बच्चों की मृत्यु का कारण कुपोषण है। वे बच्चे जो जीवित रह जाते हैं, स्थायी रूप से उस क्षति से ग्रसित रहते हैं जो उनके शरीर और मन में उपयुक्त खाद्यों एवं पोषकों के पर्याप्त मात्रा में न मिलने से हो चुकी होती है। 5 वर्ष से कम आयु के लगभग 44 मिलियन बच्चे अविकसित हैं। इससे उनको विद्यालय में सीखने और वयस्क होने पर जीविका कमाने में कठिनाई होती है। उनकी जीवनकालीन उपार्जन क्षमता उनके स्वस्थ समकक्षों से लगभग एक चौथाई कम होती है।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ है/हैं?
1. भारत की सार्वजनिक वितरण प्रणाली को केन्द्र सरकार द्वारा मॉनीटर किया जाना चाहिए।
2. बालिकाओं को विवाह एवं प्रथम गर्भ विलम्बित करने के लिए प्रोत्साहित करना चाहिए।
3. जन्म के तुरंत बाद नवजात को स्तनपान कराने हेतु माताओं को प्रोत्साहित करना चाहिए।
4. सभी के लिए सुरक्षित पेय जल एवं उपयुक्त स्वच्छता सुविधाओं की आपूर्ति सुनिश्चित करनी चाहिए।
5. प्राधिकारियों को यथानिर्धारित टीकाकरण सुनिश्चित करना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1, 2, 3 and 4', '2, 3, 4 and 5', '1 only', '3 and 5 only', '1, 2, 3 और 4', '2, 3, 4 और 5', 'केवल 1', 'केवल 3 और 5', 'B', 'Correct Answer: Option B (2, 3, 4 and 5).

1. Why Statements 2, 3, 4, and 5 are correct: The passage describes the widespread crisis of early childhood malnutrition, under-5 mortality, and stunting. Addressing child stunting and malnutrition practically requires a comprehensive public health and maternal-child approach: delaying marriage and teenage pregnancy prevents low-birthweight babies (2), immediate breastfeeding delivers essential early nutrients and antibodies (3), safe drinking water and sanitation prevent chronic enteric infections that hinder nutrient absorption (4), and immunization protects against debilitating childhood diseases that worsen malnutrition (5).
2. Why Statement 1 is incorrect: Centralizing the monitoring of the Public Distribution System (PDS) under the Union Government is a specific administrative shift not mentioned in the passage, and grain distribution alone fails to address the underlying physiological, dietary diversity, and sanitary causes of infant stunting.

Therefore, 2, 3, 4, and 5 are the most rational and practical implications.', 'सही उत्तर: विकल्प B (2, 3, 4 और 5)।

1. कथन 2, 3, 4 और 5 क्यों सही हैं: परिच्छेद में बच्चों में व्यापक कुपोषण, 5 वर्ष से कम आयु में मृत्यु और शारीरिक-मानसिक अविकसितता (stunting) की समस्या पर प्रकाश डाला गया है। बाल कुपोषण को रोकने के लिए स्वास्थ्य विज्ञान और नीति के स्थापित व्यावहारिक उपाय हैं: बालिकाओं के विवाह व गर्भधारण में देरी करना (2), जन्म के तुरंत बाद स्तनपान कराना (3), स्वच्छ जल व स्वच्छता सुनिश्चित करना ताकि संक्रमण से पोषण का ह्रास न हो (4), तथा बच्चों का समय पर पूर्ण टीकाकरण करना (5)।
2. कथन 1 क्यों गलत है: PDS की निगरानी केंद्र सरकार को सौंपना एक विशिष्ट प्रशासनिक विकल्प है, जिसका परिच्छेद में कोई उल्लेख नहीं है और केवल खाद्यान्न वितरण से कुपोषण के सूक्ष्म-पोषक व स्वास्थ्य संबंधी कारणों का समाधान नहीं होता।

अतः 2, 3, 4 और 5 सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हैं।', NULL),
    ('csat-2020-q43', 43, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Rational Inferences on Global Geopolitics & Regional Groupings', 'वैश्विक भू-राजनीति एवं क्षेत्रीय गुटों पर तर्कसंगत निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'International Relations', 'Multilateralism']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
The pulse variety ''Pusa Arhar 16'' has the potential to be grown in the paddy-growing regions of Punjab, Haryana and Uttar Pradesh and eventually in all of India. Its yield (about 2000 kg/hectare) will be significantly greater than those of the existing varieties and because its size will be uniform, it will be amenable to mechanical harvesting, an attractive feature for farmers in northern India who currently use this technology for paddy. Most important, Arhar straw, unlike paddy straw, is green and can be ploughed back into the soil. In paddy straw, the problem is the high silica content, which does not allow for easy decomposition. In the case of Arhar, the farmer, even after combine harvesting, just needs to run a rotovator to cut the leftover straw into pieces, which can be ploughed back and will decompose very fast. All this is difficult with leftover paddy stalks that cannot be easily salvaged or ploughed back. Farmers, therefore, choose the easiest option of simply burning it.

Which of the following are the most rational inferences that can be made from the passage?
1. Farmers'' income will be higher with pulse cultivation than with paddy cultivation.
2. Pulse cultivation causes less pollution as compared to paddy cultivation.
3. Pulse straw can be used to improve soil quality.
4. In the context of northern Indian agriculture, paddy straw has no usefulness.
5. Mechanized agriculture is the main cause for stubble burning.
Select the correct answer using the code given below.', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
दलहन की प्रजाति ''पूसा अरहर 16'' को पंजाब, हरियाणा और उत्तर प्रदेश के धान उगाने वाले क्षेत्रों और अंततः सम्पूर्ण भारत में उगाए जा सकने की संभावना है। उसकी उत्पादकता (लगभग 2000 कि० ग्रा०/हेक्टेयर) उपलब्ध प्रजातियों की तुलना में महत्त्वपूर्ण रूप से अधिक होगी और चूँकि उसके आकार में एकरूपता होगी, उसकी कटाई मशीनों से भी संभव होगी एवं उत्तरी भारत के उन कृषकों, जो आजकल इस तकनीक का प्रयोग धान के लिए करते हैं, के लिए एक आकर्षक विशेषता होगी। सबसे महत्त्वपूर्ण यह है कि अरहर का पुआल, धान के पुआल के विपरीत, हरा होता है और उसे मृदा में वापस जोता जा सकता है। धान के पुआल में परेशानी यह है कि सेलखड़ी (silica) की मात्रा अधिक होती है जो आसानी से उसका अपघटन नहीं होने देती। अरहर में कंबाइन कटाई के बाद भी कृषक को बचे हुए पुआल को छोटे टुकड़ों में काटने के लिए केवल रोटोवेटर चलाने की आवश्यकता होती है जिन्हें वापस जोता जा सकता है और जो बहुत तेजी से अपघटित हो जाते हैं। यह कार्य धान के बचे हुए डंठलों के साथ कठिन है जिन्हें आसानी से निकाला या वापस नहीं जोता जा सकता। इसलिए, कृषक साधारणतः इसे जलाने का आसान रास्ता चुनते हैं।

निम्नलिखित में से कौन-से ऐसे सर्वाधिक तर्कसंगत निष्कर्ष हैं जो उपर्युक्त परिच्छेद से निकाले जा सकते हैं?
1. धान की तुलना में दलहन उगाने से कृषकों की आय अधिक होगी।
2. दलहन उगाना, धान उगाने की तुलना में कम प्रदूषण उत्पन्न करता है।
3. दलहन के पुआल का प्रयोग मृदा की गुणवत्ता में सुधार लाने के लिए किया जा सकता है।
4. उत्तरी भारत की कृषि के संदर्भ में, धान के पुआल की कोई उपयोगिता नहीं है।
5. मशीनीकृत खेती ठूंठ जलाने का प्रमुख कारक है।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '2, 3 and 5', '1, 4 and 5', '2 and 3 only', '1 and 4 only', '2, 3 और 5', '1, 4 और 5', 'केवल 2 और 3', 'केवल 1 और 4', 'C', 'Correct Answer: Option C (2 and 3 only).

1. Why Inferences 2 and 3 are correct: The passage explains that Arhar straw can be easily cut and ploughed back into the soil to decompose rapidly, enriching the soil with organic matter and improving soil quality (3). In contrast, paddy straw has high silica, resists decomposition, and is burnt by farmers; therefore, cultivating pulses avoids stubble burning and generates less air pollution (2).
2. Why Inference 1 is incorrect: The passage states that Pusa Arhar 16 has a higher yield than other pulse varieties, but does not provide financial or income comparisons against paddy cultivation.
3. Why Inference 4 is incorrect: The passage describes the difficulty in ploughing back paddy straw due to silica, but does not state that paddy straw has zero usefulness in all agricultural contexts.
4. Why Inference 5 is incorrect: Farmers burn stubble because high silica prevents easy decomposition and ploughing back, not because mechanization itself is the primary cause.

Therefore, only inferences 2 and 3 are correct.', 'सही उत्तर: विकल्प C (केवल 2 और 3)।

1. निष्कर्ष 2 और 3 क्यों सही हैं: परिच्छेद बताता है कि अरहर का पुआल हरा होता है और रोटोवेटर चलाकर मिट्टी में जोतने पर तेजी से गलकर खाद बन जाता है, जिससे मृदा की गुणवत्ता में सुधार होता है (3)। चूँकि धान के पुआल में सिलिका की अधिकता के कारण किसान उसे जलाते हैं, अतः दलहन उगाने से पराली जलाने की आवश्यकता नहीं पड़ती और प्रदूषण कम होता है (2)।
2. निष्कर्ष 1 क्यों गलत है: परिच्छेद ''पूसा अरहर 16'' की उत्पादकता की तुलना अन्य दलहन प्रजातियों से करता है, यह धान की तुलना में कुल किसान आय अधिक होने का दावा नहीं करता।
3. निष्कर्ष 4 क्यों गलत है: परिच्छेद धान के पुआल के अपघटन की समस्या बताता है, यह नहीं कहता कि उसकी कोई उपयोगिता नहीं है।
4. निष्कर्ष 5 क्यों गलत है: किसान पराली इसलिए जलाते हैं क्योंकि धान के डंठल आसानी से अपघटित नहीं होते, मशीनीकरण इसका मूल कारण नहीं है।

अतः केवल 2 और 3 सर्वाधिक तर्कसंगत निष्कर्ष हैं।', NULL),
    ('csat-2020-q44', 44, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Multilateral Governance & Global Hegemony', 'बहुपक्षीय शासन एवं वैश्विक प्रभुत्व संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Global Governance', 'Critical Assumptions']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
In India, authorities always look to store the maximum amount of water in reservoirs during the monsoon season, which is then used for irrigation and generation of electricity during the summer months. It is an internationally accepted practice that the water level of a reservoir should be kept below a certain level before the onset of monsoon season. This is so that when monsoon rains come, there is space to store the excess rainwater and also so that water can be released in a regulated manner. But the authorities store the maximum amount of water in reservoirs even before the close of the monsoon, only to ensure greater electricity generation and irrigation.

With reference to the above passage, the following assumptions have been made:
1. High risks involved in holding maximum water in reservoirs are due to our over-dependence on hydropower projects.
2. Storage capacity of dams should not be fully used before or during monsoon season.
3. Role of dams in flood control is underestimated in India.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
भारत में, प्राधिकारी मानसून ऋतु में जलाशयों में अधिकतम जल संचय करने की कोशिश करते हैं, जिसे गर्मी के महीनों में सिंचाई एवं विद्युत् उत्पादन के लिए प्रयोग में लाया जाता है। मानसून ऋतु आने के समय जलाशय में जल को एक निश्चित स्तर से नीचे बनाए रखना एक अंतर्राष्ट्रीय रूप में स्वीकार्य प्रथा है। ऐसा इसलिए है क्योंकि जब मानसून की वर्षा होती है तो अतिरेक वर्षा जल के संचयन के लिए जगह हो तथा जल को नियंत्रित रूप में छोड़ा भी जा सके। परंतु प्राधिकारी मानसून के समाप्त होने से पहले ही जलाशयों में अधिक-से-अधिक जल संचय कर लेते हैं, जिससे अधिक विद्युत् उत्पादन एवं सिंचाई सुनिश्चित की जा सके।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जलाशयों में अधिकतम जल संचयन में होने वाले भारी जोखिम, जलशक्ति परियोजनाओं पर हमारी अत्यधिक निर्भरता के कारण है।
2. बाँधों की संग्रहण क्षमता का मानसून ऋतु के पूर्व अथवा दौरान पूर्ण उपयोग नहीं किया जाना चाहिए।
3. भारत में बाढ़ नियंत्रण के लिए बाँधों की भूमिका को कम करके आँका गया है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 and 2 only', '2 only', '3 only', '1, 2 and 3', 'केवल 1 और 2', 'केवल 2', 'केवल 3', '1, 2 और 3', 'D', 'Correct Answer: Option D (1, 2 and 3).

1. Why Assumption 1 is valid: The passage states that authorities prematurely fill reservoirs to the maximum "only to ensure greater electricity generation and irrigation," indicating that the high operational risks of premature filling stem directly from prioritizing and relying heavily on hydropower and irrigation storage.
2. Why Assumption 2 is valid: The passage explicitly cites international best practice that reservoir levels should be kept below maximum capacity prior to and during the monsoon to leave buffer space for incoming flood waters.
3. Why Assumption 3 is valid: Because authorities focus primarily on maximizing storage for electricity and irrigation rather than maintaining flood cushions, the critical role of dams in flood moderation and control is underestimated and compromised in practice.

Therefore, all assumptions 1, 2, and 3 are valid.', 'सही उत्तर: विकल्प D (1, 2 और 3)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद बताता है कि प्राधिकारी मानसून समाप्त होने से पहले ही जलाशयों को अधिकतम भर लेते हैं ताकि अधिक बिजली उत्पादन और सिंचाई सुनिश्चित हो सके, जो यह पूर्वधारित करता है कि भारी जोखिम जलशक्ति व सिंचाई भंडारण पर अत्यधिक निर्भरता के कारण है।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद के अनुसार अंतरराष्ट्रीय स्तर पर स्वीकृत नियम यह है कि मानसून के दौरान अतिरिक्त जल के सुरक्षित संचयन और बाढ़ से बचाव हेतु बाँधों को पूरी क्षमता तक नहीं भरा जाना चाहिए।
3. पूर्वधारणा 3 क्यों वैध है: बाँधों में बाढ़ नियंत्रण के लिए स्थान छोड़ने के बजाय केवल बिजली उत्पादन और सिंचाई को प्राथमिकता देना यह दर्शाता है कि भारत में बाढ़ नियंत्रण में बाँधों की भूमिका को कम आँका गया है।

अतः 1, 2 और 3 तीनों पूर्वधारणाएँ वैध हैं।', NULL),
    ('csat-2020-q45', 45, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Democracy, Minority Rights & Constitution', 'लोकतंत्र, अल्पसंख्यक अधिकार एवं संविधान पर निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Constitutionalism', 'Democracy']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Economic liberalization in India was shaped largely by the economic problems of the government than by the economic priorities of the people or by the long-term development objectives. Thus, there were limitations in conception and design which have been subsequently validated by experience. Jobless growth, persistent poverty and rising inequality have mounted as problems since economic liberalization began. And all these years later, four quiet crises confront the economy; agriculture, infrastructure, industrialization and education as constraints on the country''s future prospects. These problems must be resolved if economic growth has to be sustained and transformed into meaningful development.

Which of the following is/are the most rational and logical inference/inferences that can be made from the passage?
1. It is essential to rethink and redefine the economic role of the State in the quest for development.
2. India has not made effective implementation of its policies in social sectors nor made sufficient investments in them.
Select the correct answer using the code given below.', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में आर्थिक उदारीकरण का स्वरूप अधिकतर सरकार की आर्थिक समस्याओं से तय हुआ था न कि जनता की आर्थिक प्राथमिकताओं से अथवा दीर्घकालीन विकास के उद्देश्यों से। अतः, संकल्पना एवं रूपरेखा की सीमाएँ थीं जो बाद में अनुभव से पुष्ट हुईं। आर्थिक उदारीकरण के प्रारंभ से रोज़गार-विहीन वृद्धि, सतत गरीबी और बढ़ती असमानता समस्याओं के रूप में उभरी हैं। और इन सभी वर्षों के बाद में, चार मौन संकट अर्थव्यवस्था के सम्मुख खड़े हुए हैं; कृषि, अधोसंरचना, उद्योगीकरण एवं शिक्षा; जो देश के भावी परिदृश्य में बंधनकारक हैं। यदि आर्थिक वृद्धि को बनाए रखना है और उसे सार्थक विकास में रूपांतरित करना है, तो इन समस्याओं का निराकरण होना ही चाहिए।

इस परिच्छेद से निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत और तार्किक निष्कर्ष निकाला/निकाले जा सकता/सकते है/हैं?
1. विकास की तलाश में यह अनिवार्य है कि राज्य की आर्थिक भूमिका पर पुनर्विचार किया जाए एवं उसे पुनर्परिभाषित किया जाए।
2. भारत ने अपने सामाजिक क्षेत्रों में न तो नीतियों का प्रभावी निष्पादन किया और न ही उनमें पर्याप्त निवेश किया।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'C', 'Correct Answer: Option C (Both 1 and 2).

1. Why Inference 1 is correct: The passage argues that economic liberalization was conceived around government fiscal crises rather than people''s priorities or long-term goals, resulting in jobless growth and structural crises. Transforming growth into meaningful development requires resolving these foundational design limitations, which makes rethinking and redefining the economic role of the State essential.
2. Why Inference 2 is correct: The ongoing crises in education, agriculture, employment, and persistent poverty directly imply that the country failed to implement effective social sector policies and make sufficient public investments in them over the liberalization era.

Therefore, both 1 and 2 are rational and logical inferences.', 'सही उत्तर: विकल्प C (1 और 2 दोनों)।

1. निष्कर्ष 1 क्यों सही है: परिच्छेद बताता है कि आर्थिक उदारीकरण की रूपरेखा जनता की प्राथमिकताओं या दीर्घकालीन विकास के बजाय सरकार की अपनी समस्याओं से तय हुई थी, जिससे रोज़गार-विहीन वृद्धि और असमानता बढ़ी। सार्थक विकास के लिए इन कमियों को दूर करना और राज्य की आर्थिक भूमिका पर पुनर्विचार व पुनर्परिभाषा करना अनिवार्य है।
2. निष्कर्ष 2 क्यों सही है: शिक्षा, कृषि और रोज़गार में लगातार बने हुए मौन संकट और सतत गरीबी यह तार्किक निष्कर्ष देते हैं कि सामाजिक क्षेत्रों में नीतियों का न तो प्रभावी क्रियान्वयन हुआ और न ही पर्याप्त निवेश किया गया।

अतः 1 और 2 दोनों सर्वाधिक तर्कसंगत निष्कर्ष हैं।', NULL),
    ('csat-2020-q46', 46, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Fundamental Rights vs Majority Rule', 'मूल अधिकार बनाम बहुमत शासन संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Majority Rule', 'Fundamental Rights']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Economic liberalization in India was shaped largely by the economic problems of the government than by the economic priorities of the people or by the long-term development objectives. Thus, there were limitations in conception and design which have been subsequently validated by experience. Jobless growth, persistent poverty and rising inequality have mounted as problems since economic liberalization began. And all these years later, four quiet crises confront the economy; agriculture, infrastructure, industrialization and education as constraints on the country''s future prospects. These problems must be resolved if economic growth has to be sustained and transformed into meaningful development.

With reference to the above passage, the following assumptions have been made:
1. India''s economy needs to be greatly integrated with global economy so as to create large number of jobs and to sustain its growth momentum.
2. Economic liberalization would cause large economic growth which would reduce poverty and create sufficient employment in the long run.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में आर्थिक उदारीकरण का स्वरूप अधिकतर सरकार की आर्थिक समस्याओं से तय हुआ था न कि जनता की आर्थिक प्राथमिकताओं से अथवा दीर्घकालीन विकास के उद्देश्यों से। अतः, संकल्पना एवं रूपरेखा की सीमाएँ थीं जो बाद में अनुभव से पुष्ट हुईं। आर्थिक उदारीकरण के प्रारंभ से रोज़गार-विहीन वृद्धि, सतत गरीबी और बढ़ती असमानता समस्याओं के रूप में उभरी हैं। और इन सभी वर्षों के बाद में, चार मौन संकट अर्थव्यवस्था के सम्मुख खड़े हुए हैं; कृषि, अधोसंरचना, उद्योगीकरण एवं शिक्षा; जो देश के भावी परिदृश्य में बंधनकारक हैं। यदि आर्थिक वृद्धि को बनाए रखना है और उसे सार्थक विकास में रूपांतरित करना है, तो इन समस्याओं का निराकरण होना ही चाहिए।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. भारत की अर्थव्यवस्था को वैश्विक अर्थव्यवस्था से अत्यधिक समेकित करने की आवश्यकता है ताकि रोज़गार का बड़ी संख्या में सृजन किया जा सके तथा इसके वृद्धि संवेग को बनाए रखा जा सके।
2. आर्थिक उदारीकरण से बृहत् आर्थिक वृद्धि होगी जिससे दीर्घकाल में गरीबी घटेगी और रोज़गार का पर्याप्त सृजन होगा।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'D', 'Correct Answer: Option D (Neither 1 nor 2).

1. Why Assumption 1 is invalid: The passage critiques the internal conceptual design of past liberalization and does not assume that deeper integration with the global economy is the answer to job creation.
2. Why Assumption 2 is invalid: The passage explicitly states that economic liberalization has led to "jobless growth, persistent poverty and rising inequality," directly opposing the assumption that liberalization will automatically reduce poverty and create sufficient employment in the long run.

Therefore, neither assumption 1 nor 2 is valid.', 'सही उत्तर: विकल्प D (न तो 1, न ही 2)।

1. पूर्वधारणा 1 क्यों अवैध है: परिच्छेद उदारीकरण की आंतरिक संकल्पना और प्राथमिकताओं की कमियों की आलोचना करता है; यह वैश्विक अर्थव्यवस्था के साथ अधिक एकीकरण को रोज़गार सृजन का समाधान नहीं मानता।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद स्पष्ट रूप से कहता है कि उदारीकरण से ''रोज़गार-विहीन वृद्धि, सतत गरीबी और बढ़ती असमानता'' की समस्याएँ पैदा हुई हैं, अतः यह मानना कि उदारीकरण दीर्घकाल में गरीबी घटाकर पर्याप्त रोज़गार सृजित करेगा, परिच्छेद के निष्कर्ष के बिल्कुल विपरीत है।

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
2. Calculate the final price paid under each option:
   * **Option 1**: $P \times (1 - 0.10) \times (1 - 0.20) \times (1 + 0.10) = P \times 0.9 \times 0.8 \times 1.1 = 0.792 P$
   * **Option 2**: $P \times (1 - 0.20) \times (1 - 0.10) \times (1 + 0.10) = P \times 0.8 \times 0.9 \times 1.1 = 0.792 P$
   * **Option 3**: $P \times (1 + 0.10) \times (1 - 0.20) \times (1 - 0.10) = P \times 1.1 \times 0.8 \times 0.9 = 0.792 P$
3. Because multiplication is commutative, the final effective payable amount is identical ($0.792 P$) in all three scenarios.

Therefore, all the options are equally good for the customer.', 'सही उत्तर: विकल्प D (ग्राहक के लिए सभी विकल्प समान रूप से अच्छे हैं)।

1. माना वस्तु का अंकित/प्रारंभिक मूल्य $P$ है।
2. प्रत्येक विकल्प के तहत अंतिम देय राशि:
   * **विकल्प 1**: $P \times (1 - 0.10) \times (1 - 0.20) \times (1 + 0.10) = P \times 0.9 \times 0.8 \times 1.1 = 0.792 P$
   * **विकल्प 2**: $P \times (1 - 0.20) \times (1 - 0.10) \times (1 + 0.10) = P \times 0.8 \times 0.9 \times 1.1 = 0.792 P$
   * **विकल्प 3**: $P \times (1 + 0.10) \times (1 - 0.20) \times (1 - 0.10) = P \times 1.1 \times 0.8 \times 0.9 = 0.792 P$
3. चूँकि गुणनफल क्रमविनिमेय (commutative) होता है, अतः तीनों ही विकल्पों में ग्राहक को एक समान राशि ($0.792 P$) का भुगतान करना होगा।

अतः ग्राहक के लिए सभी विकल्प समान रूप से अच्छे हैं।', NULL),
    ('csat-2020-q48', 48, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Alphabet Alphabetical Positional Values & Arithmetic Coding', 'वर्णमाला स्थितीय मान एवं अंकगणितीय कोडिंग', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Coding-Decoding', 'Letter Positions']::TEXT[], 'The letters from A to Z are numbered from 1 to 26 respectively. If GHI = 1578 and DEF = 912, then what is ABC equal to?', 'A से Z तक के वर्ण 1 से 26 तक क्रमशः क्रमांकित किए गए हैं। यदि GHI = 1578 और DEF = 912 हों, तो ABC किसके बराबर है?', '492', '468', '262', '246', '492', '468', '262', '246', 'D', 'Correct Answer: Option D (246).

1. Replace each letter with its positional value in the alphabet to form a multi-digit number, then observe the multiplying factor:
   * For $GHI$: $G = 7, H = 8, I = 9 \implies 789$. Multiplying by 2: $789 \times 2 = 1578$.
   * For $DEF$: $D = 4, E = 5, F = 6 \implies 456$. Multiplying by 2: $456 \times 2 = 912$.
2. Apply the same rule to $ABC$:
   * For $ABC$: $A = 1, B = 2, C = 3 \implies 123$.
   * Value $= 123 \times 2 = 246$.

Therefore, ABC is equal to 246.', 'सही उत्तर: विकल्प D (246)।

1. वर्णों के वर्णमाला क्रमांकों को मिलाकर बनने वाली संख्या का संबंध देखने पर:
   * $GHI$: $G = 7, H = 8, I = 9 \implies 789$, और $789 \times 2 = 1578$
   * $DEF$: $D = 4, E = 5, F = 6 \implies 456$, और $456 \times 2 = 912$
2. इसी नियम के अनुसार $ABC$ के लिए:
   * $ABC$: $A = 1, B = 2, C = 3 \implies 123$
   * मान $= 123 \times 2 = 246$

अतः ABC का मान 246 के बराबर है।', NULL),
    ('csat-2020-q49', 49, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति', 'Letter Cluster Analogy & Alphabet Shift Patterns', 'अक्षर समूह सादृश्यता एवं वर्णमाला विस्थापन पैटर्न', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Logical Reasoning', 'Analogy', 'Letter Shifts']::TEXT[], 'What is the missing term @ in the following?
$$\text{ACPQ : BESU :: MNGI : @}$$', 'निम्न में लुप्त पद @ क्या है?
$$\text{ACPQ : BESU :: MNGI : @}$$', 'NPJL', 'NOJM', 'NPIL', 'NPJM', 'NPJL', 'NOJM', 'NPIL', 'NPJM', 'D', 'Correct Answer: Option D (NPJM).

1. Determine the positional letter-shift pattern between $\text{ACPQ}$ and $\text{BESU}$:
   * $A (1) + 1 = B (2)$
   * $C (3) + 2 = E (5)$
   * $P (16) + 3 = S (19)$
   * $Q (17) + 4 = U (21)$
   The shifts across the four letter positions are $+1, +2, +3, +4$.
2. Apply the identical rule to $\text{MNGI}$:
   * $M (13) + 1 = N (14)$
   * $N (14) + 2 = P (16)$
   * $G (7) + 3 = J (10)$
   * $I (9) + 4 = M (13)$

Therefore, the missing term is NPJM.', 'सही उत्तर: विकल्प D (NPJM)।

1. $\text{ACPQ}$ और $\text{BESU}$ के बीच वर्णों के विस्थापन का नियम:
   * $A (1) + 1 = B (2)$
   * $C (3) + 2 = E (5)$
   * $P (16) + 3 = S (19)$
   * $Q (17) + 4 = U (21)$
   यहाँ विस्थापन का क्रम $+1, +2, +3, +4$ है।
2. इसी क्रम को $\text{MNGI}$ पर लागू करने पर:
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

1. Using the negative exponent rule $(1/a)^{-b} = a^b$, evaluate the numerical value of each option:
   * Option A: $\left(\frac{1}{2}\right)^{-6} = 2^6 = 64$
   * Option B: $\left(\frac{1}{4}\right)^{-3} = 4^3 = 64$
   * Option C: $\left(\frac{1}{3}\right)^{-4} = 3^4 = 81$
   * Option D: $\left(\frac{1}{6}\right)^{-2} = 6^2 = 36$
2. Comparing the evaluated numbers: $81 > 64 = 64 > 36$.

Therefore, $(1/3)^{-4}$ is the largest number.', 'सही उत्तर: विकल्प C ($(1/3)^{-4}$)।

1. ऋणात्मक घातांक नियम $(1/a)^{-b} = a^b$ के अनुसार प्रत्येक विकल्प का मान निकालने पर:
   * (a) $\left(\frac{1}{2}\right)^{-6} = 2^6 = 64$
   * (b) $\left(\frac{1}{4}\right)^{-3} = 4^3 = 64$
   * (c) $\left(\frac{1}{3}\right)^{-4} = 3^4 = 81$
   * (d) $\left(\frac{1}{6}\right)^{-2} = 6^2 = 36$
2. मानों की तुलना करने पर: $81 > 64 = 64 > 36$।

अतः सबसे बड़ी संख्या $(1/3)^{-4}$ है।', NULL),
    ('csat-2020-q51', 51, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'HCF of Mixed Fractions & Unit Conversion in Lengths', 'मिश्रित भिन्नों का महत्तम समापवर्तक (HCF) एवं लंबाई इकाई रूपांतरण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'HCF of Fractions', 'Mensuration Units']::TEXT[], 'What is the greatest length x such that $3\frac{1}{2}\text{ m}$ and $8\frac{3}{4}\text{ m}$ are integral multiples of x?', 'अधिकतम लम्बाई x क्या होगी, जिससे कि $3\frac{1}{2}\text{ m}$ और $8\frac{3}{4}\text{ m}$, x के पूर्णांक गुणज हों?', '1 1/2 m', '1 1/3 m', '1 1/4 m', '1 3/4 m', '1 1/2 m', '1 1/3 m', '1 1/4 m', '1 3/4 m', 'D', 'Correct Answer: Option D ($1\frac{3}{4}\text{ m}$).

1. For both lengths to be integral multiples of $x$, $x$ must be the Highest Common Factor (HCF) of $3\frac{1}{2}\text{ m}$ and $8\frac{3}{4}\text{ m}$.
2. Convert the mixed numbers into improper fractions:
   $$3\frac{1}{2} = \frac{7}{2} = \frac{14}{4}\text{ m}, \quad 8\frac{3}{4} = \frac{35}{4}\text{ m}$$
3. Calculate the HCF of the fractions:
   $$\text{HCF}\left(\frac{14}{4}, \frac{35}{4}\right) = \frac{\text{HCF}(14, 35)}{\text{LCM}(4, 4)} = \frac{7}{4} = 1\frac{3}{4}\text{ m}$$

Therefore, the greatest length x is $1\frac{3}{4}\text{ m}$.', 'सही उत्तर: विकल्प D ($1\frac{3}{4}\text{ m}$)।

1. यदि दोनों लम्बाइयाँ $x$ के पूर्णांक गुणज हैं, तो $x$ दोनों का महत्तम समापवर्तक (HCF) होगा।
2. मिश्र भिन्नों को विषम भिन्नों में बदलने पर:
   $$3\frac{1}{2} = \frac{7}{2} = \frac{14}{4}\text{ m}, \quad 8\frac{3}{4} = \frac{35}{4}\text{ m}$$
3. भिन्नों का HCF:
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
2. Compute the natural growth rate for each given period:
   * 1911-1921: $48.1 - 35.5 = 12.6$
   * 1921-1931: $46.4 - 36.3 = 10.1$
   * 1931-1941: $45.2 - 31.2 = 14.0$
   * 1941-1951: $39.9 - 27.4 = 12.5$
   * 1951-1961: $41.7 - 22.8 = 18.9$
   * 1961-1971: $41.1 - 18.9 = 22.2$
   * 1971-1981: $37.1 - 14.8 = 22.3$
3. The maximum natural growth rate is $22.3$, occurring in the period 1971-1981.

Therefore, the natural growth rate was maximum during 1971-1981.', 'सही उत्तर: विकल्प D (1971-1981)।

1. प्राकृतिक विकास दर की गणना का सूत्र: $\text{प्राकृतिक विकास दर} = \text{जन्मदर} - \text{मृत्यु दर}$।
2. प्रत्येक समयावधि के लिए अंतर ज्ञात करने पर:
   * 1911-1921: $48.1 - 35.5 = 12.6$
   * 1921-1931: $46.4 - 36.3 = 10.1$
   * 1931-1941: $45.2 - 31.2 = 14.0$
   * 1941-1951: $39.9 - 27.4 = 12.5$
   * 1951-1961: $41.7 - 22.8 = 18.9$
   * 1961-1971: $41.1 - 18.9 = 22.2$
   * 1971-1981: $37.1 - 14.8 = 22.3$
3. सर्वाधिक दर 22.3 समयावधि 1971-1981 में प्राप्त होती है।

अतः 1971-1981 की समयावधि में प्राकृतिक विकास दर अधिकतम थी।', NULL),
    ('csat-2020-q53', 53, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Recurring Decimal Conversion to Rational Fractions', 'आवर्ती दशमलव का परिमेय भिन्न में रूपांतरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Recurring Decimals', 'Fractions']::TEXT[], 'The recurring decimal representation 1.272727... is equivalent to', 'आवर्त दशमलव निरूपण 1-272727... किसके समान है?', '13/11', '14/11', '127/99', '137/99', '13/11', '14/11', '127/99', '137/99', 'B', 'Correct Answer: Option B (14/11).

1. Let $x = 1.272727\dots = 1.\overline{27}$.
2. Multiply by 100:
   $$100x = 127.272727\dots$$
3. Subtract the original equation from this:
   $$100x - x = 127.\overline{27} - 1.\overline{27}$$
   $$99x = 126$$
4. Reduce the fraction by dividing numerator and denominator by 9:
   $$x = \frac{126}{99} = \frac{14}{11}$$

Therefore, 1.272727... is equivalent to 14/11.', 'सही उत्तर: विकल्प B (14/11)।

1. माना $x = 1.272727\dots = 1.\overline{27}$।
2. दोनों पक्षों में 100 से गुणा करने पर:
   $$100x = 127.272727\dots$$
3. घटाने पर:
   $$100x - x = 127.\overline{27} - 1.\overline{27}$$
   $$99x = 126$$
4. भिन्न को 9 से विभाजित कर सरल करने पर:
   $$x = \frac{126}{99} = \frac{14}{11}$$

अतः आवर्त दशमलव 1.272727... का मान 14/11 के समान है।', NULL),
    ('csat-2020-q54', 54, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'LCM & Constant Remainder Theorem for 4-Digit Integers', 'लघुत्तम समापवर्त्य (LCM) एवं 4-अंकीय संख्याओं के लिए शेषफल प्रमेय', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'LCM', 'Remainder Theorem']::TEXT[], 'What is the least four-digit number when divided by 3, 4, 5 and 6 leaves a remainder 2 in each case?', 'चार अंकों की सबसे छोटी संख्या कौन-सी है जिसे 3, 4, 5 और 6 से विभाजित करने पर प्रत्येक बार 2 शेष बचता है?', '1012', '1022', '1122', '1222', '1012', '1022', '1122', '1222', 'B', 'Correct Answer: Option B (1022).

1. Find the LCM of the divisors 3, 4, 5, and 6:
   $$\text{LCM}(3, 4, 5, 6) = 60$$
2. Any number satisfying the condition must be of the form $N = 60k + 2$.
3. The smallest 4-digit number is 1000. Dividing 1000 by 60:
   $$1000 = 60 \times 16 + 40$$
4. The smallest 4-digit multiple of 60 is $60 \times 17 = 1020$.
5. Adding the common remainder of 2:
   $$N = 1020 + 2 = 1022$$

Therefore, the least four-digit number is 1022.', 'सही उत्तर: विकल्प B (1022)।

1. भाजकों 3, 4, 5 और 6 का ल.स.प. (LCM) निकालने पर:
   $$\text{LCM}(3, 4, 5, 6) = 60$$
2. अभीष्ट संख्या का रूप $N = 60k + 2$ होगा।
3. चार अंकों की सबसे छोटी संख्या 1000 है। $1000 \div 60$ करने पर शेषफल 40 बचता है।
4. अतः चार अंकों का 60 का सबसे छोटा गुणज $= 60 \times 17 = 1020$ है।
5. शेषफल 2 जोड़ने पर:
   $$N = 1020 + 2 = 1022$$

अतः चार अंकों की सबसे छोटी संख्या 1022 है।', NULL),
    ('csat-2020-q55', 55, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Demographic Percentage & Marriage Proportion Equations', 'जनसंख्या प्रतिशत एवं वैवाहिक अनुपात समीकरण', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Percentages', 'Ratio & Proportion']::TEXT[], 'In adult population of a city, 40% men and 30% women are married. What is the percentage of married adult population if no man marries more than one woman and no woman marries more than one man; and there are no widows and widowers?', 'एक शहर की वयस्क समष्टि में 40% पुरुष और 30% महिलाएँ विवाहित हैं। विवाहित वयस्क समष्टि का प्रतिशत क्या है, यदि कोई भी पुरुष एक से अधिक महिला से विवाह नहीं करता है और कोई भी महिला एक से अधिक पुरुष से विवाह नहीं करती है; और इनमें कोई विधवा और विधुर नहीं है?', '33 1/7%', '34%', '34 2/7%', '35%', '33 1/7%', '34%', '34 2/7%', '35%', 'C', 'Correct Answer: Option C ($34\frac{2}{7}\%$).

1. Let $M$ be the total adult male population and $W$ be the total adult female population.
2. Since monogamy holds and there are no widows/widowers, the number of married men equals the number of married women:
   $$0.40 M = 0.30 W \implies \frac{M}{W} = \frac{3}{4}$$
3. Let $M = 300$ and $W = 400$. Total adult population $= 300 + 400 = 700$.
4. Number of married men $= 0.40 \times 300 = 120$.
   Number of married women $= 0.30 \times 400 = 120$.
   Total married adult population $= 120 + 120 = 240$.
5. Percentage of married adult population:
   $$\text{Percentage} = \frac{240}{700} \times 100\% = \frac{240}{7}\% = 34\frac{2}{7}\%$$

Therefore, the percentage of married adult population is $34\frac{2}{7}\%$.', 'सही उत्तर: विकल्प C ($34\frac{2}{7}\%$)।

1. माना वयस्क पुरुषों की संख्या $M$ तथा वयस्क महिलाओं की संख्या $W$ है।
2. चूँकि विवाहित पुरुषों और विवाहित महिलाओं की संख्या बराबर होगी:
   $$0.40 M = 0.30 W \implies \frac{M}{W} = \frac{3}{4}$$
3. माना $M = 300$ और $W = 400$, अतः कुल वयस्क जनसंख्या $= 300 + 400 = 700$।
4. विवाहित पुरुषों की संख्या $= 0.40 \times 300 = 120$ तथा विवाहित महिलाओं की संख्या $= 120$।
   कुल विवाहित वयस्क $= 120 + 120 = 240$।
5. विवाहित वयस्क समष्टि का प्रतिशत:
   $$\frac{240}{700} \times 100\% = \frac{240}{7}\% = 34\frac{2}{7}\%$$

अतः विवाहित वयस्क समष्टि का प्रतिशत $34\frac{2}{7}\%$ है।', NULL),
    ('csat-2020-q56', 56, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Modular Arithmetic, Factor Cancellation & Remainder in Large Products', 'मॉड्यूलर अंकगणित, गुणनखंड निरसन एवं वृहद् गुणनफल शेषफल', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Remainders', 'Modular Arithmetic']::TEXT[], 'What is the remainder when $51 \times 27 \times 35 \times 62 \times 75$ is divided by 100?', 'जब $51\times27\times35\times62\times75$ को 100 से विभाजित किया जाता है, तो शेषफल क्या है?', '50', '25', '5', '1', '50', '25', '5', '1', 'A', 'Correct Answer: Option A (50).

1. Let $N = 51 \times 27 \times 35 \times 62 \times 75$.
2. Factorize the prime powers of 2 and 5 in $N$:
   * $62 = 2 \times 31$ (contains one factor of 2)
   * $35 = 5 \times 7$ (contains one factor of 5)
   * $75 = 25 \times 3 = 5^2 \times 3$ (contains two factors of 5)
3. Regroup the factors $2 \times 25 = 50$:
   $$N = 50 \times (51 \times 27 \times 7 \times 31 \times 15) = 50 \times (\text{an odd integer } k)$$
4. Any odd multiple of 50 ends with the two digits ''50'' (e.g., 50, 150, 250, ...), which gives a remainder of 50 when divided by 100.

Therefore, the remainder is 50.', 'सही उत्तर: विकल्प A (50)।

1. गुणनफल $N = 51 \times 27 \times 35 \times 62 \times 75$।
2. 2 और 5 के गुणनखंडों को अलग करने पर:
   * $62 = 2 \times 31$
   * $35 = 5 \times 7$
   * $75 = 25 \times 3$
3. $N = (2 \times 25) \times (51 \times 27 \times 7 \times 31 \times 15) = 50 \times (\text{एक विषम पूर्णांक})$।
4. 50 का कोई भी विषम गुणज (जैसे 50, 150, 250, ...) 100 से भाग देने पर सदैव 50 शेषफल देता है।

अतः 100 से विभाजित करने पर शेषफल 50 होगा।', NULL),
    ('csat-2020-q57', 57, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Fractional Ratio Simplification & Monetary Distribution', 'भिन्न अनुपातों का सरलीकरण एवं धनराशि वितरण', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Ratio & Proportion', 'Division of Amounts']::TEXT[], 'A sum of ₹2,500 is distributed among X, Y and Z in the ratio $\frac{1}{2} : \frac{3}{4} : \frac{5}{6}$. What is the difference between the maximum share and the minimum share?', '₹2,500 की एक धनराशि को X, Y और Z में $\frac{1}{2}:\frac{3}{4}:\frac{5}{6}$ के अनुपात में वितरित किया जाता है। अधिकतम अंश और न्यूनतम अंश के बीच अंतर क्या है?', '300', '350', '400', '450', '300', '350', '400', '450', 'C', 'Correct Answer: Option C (400).

1. Clear denominators by multiplying the fractional ratio by $\text{LCM}(2, 4, 6) = 12$:
   $$X : Y : Z = \left(\frac{1}{2} \times 12\right) : \left(\frac{3}{4} \times 12\right) : \left(\frac{5}{6} \times 12\right) = 6 : 9 : 10$$
2. Total ratio parts $= 6 + 9 + 10 = 25$ parts.
3. Value per part $= \frac{2500}{25} = 100$.
4. Maximum share is Z ($10 \times 100 = 1000$) and minimum share is X ($6 \times 100 = 600$).
5. Difference $= 1000 - 600 = 400$.

Therefore, the difference between the maximum and minimum share is 400.', 'सही उत्तर: विकल्प C (400)।

1. भिन्नों के हरों के ल.स.प. (12) से गुणा करके अनुपात को पूर्णांक में बदलने पर:
   $$X : Y : Z = \left(\frac{1}{2} \times 12\right) : \left(\frac{3}{4} \times 12\right) : \left(\frac{5}{6} \times 12\right) = 6 : 9 : 10$$
2. कुल अनुपाती भाग $= 6 + 9 + 10 = 25$ भाग।
3. 1 भाग का मान $= \frac{2500}{25} = 100$ रुपये।
4. अधिकतम अंश Z ($10 \times 100 = 1000$) और न्यूनतम अंश X ($6 \times 100 = 600$) है।
5. अंतर $= 1000 - 600 = 400$ रुपये।

अतः अधिकतम अंश और न्यूनतम अंश के बीच अंतर 400 है।', NULL),
    ('csat-2020-q58', 58, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Digit Sum of Powers of Ten Expressions (10^n + 1)', 'दस की घात व्यंजकों (10^n + 1) के अंकों का योग', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Number System', 'Powers of 10', 'Sum of Digits']::TEXT[], 'For what value of n, the sum of digits in the number $(10^n + 1)$ is 2?', 'n के किस मान के लिए संख्या $(10^n+1)$ में अंकों का योग 2 है?', 'For n = 0 only', 'For any whole number n', 'For any positive integer n only', 'For any real number n', 'केवल n = 0 के लिए', 'किसी पूर्ण संख्या n के लिए', 'केवल किसी धनात्मक पूर्णांक n के लिए', 'किसी वास्तविक संख्या n के लिए', 'B', 'Correct Answer: Option B (For any whole number n).

1. Check whole numbers $n \in \{0, 1, 2, 3, \dots\}$:
   * If $n = 0$: $10^0 + 1 = 1 + 1 = 2$. Sum of digits $= 2$.
   * If $n = 1$: $10^1 + 1 = 11$. Sum of digits $= 1 + 1 = 2$.
   * If $n = 2$: $10^2 + 1 = 101$. Sum of digits $= 1 + 0 + 1 = 2$.
   * For any integer $n \ge 1$: $10^n + 1 = 100\dots01$ (with $n-1$ zeroes between the two $1$s). The sum of the digits is always $1 + 0 + \dots + 0 + 1 = 2$.
2. Since it holds for $n = 0$ and all positive integers, it is true for any whole number $n$.

Therefore, the statement holds for any whole number n.', 'सही उत्तर: विकल्प B (किसी पूर्ण संख्या n के लिए)।

1. पूर्ण संख्याओं ($n = 0, 1, 2, 3, \dots$) के लिए परीक्षण करने पर:
   * $n = 0$ के लिए: $10^0 + 1 = 1 + 1 = 2$ (अंकों का योग $= 2$)
   * $n = 1$ के लिए: $10^1 + 1 = 11$ (अंकों का योग $= 1 + 1 = 2$)
   * $n = 2$ के लिए: $10^2 + 1 = 101$ (अंकों का योग $= 1 + 0 + 1 = 2$)
   * किसी भी धनात्मक पूर्णांक $n$ के लिए, संख्या का स्वरूप $100\dots01$ होता है जिसमें केवल दो ''1'' और बीच में शून्य होते हैं, अतः अंकों का योग सदैव $1 + 1 = 2$ रहता है।
2. चूँकि यह $n = 0$ और सभी धनात्मक पूर्णांकों के लिए सत्य है, अतः यह किसी भी पूर्ण संख्या $n$ के लिए मान्य है।

अतः किसी पूर्ण संख्या n के लिए अंकों का योग 2 है।', NULL),
    ('csat-2020-q59', 59, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Group Averages & Inter-Group Transfer Invariance', 'समूह औसत एवं अंतर-समूह स्थानांतरण अपरिवर्तनीयता', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Class Distribution']::TEXT[], 'In a class, there are three groups A, B and C. If one student from group A and two students from group B are shifted to group C, then what happens to the average weight of the students of the class?', 'एक कक्षा में तीन समूह A, B और C हैं। यदि समूह A से एक विद्यार्थी और समूह B से दो विद्यार्थियों को समूह C में स्थानांतरित किया जाता है, तो कक्षा के विद्यार्थियों के औसत भार का क्या होगा?', 'It increases.', 'It decreases.', 'It remains the same.', 'No conclusion can be drawn due to insufficient data.', 'यह बढ़ जाएगा।', 'यह घट जाएगा।', 'यह वही रहेगा।', 'अपर्याप्त आँकड़ों के कारण कोई निष्कर्ष नहीं निकाला जा सकता है।', 'C', 'Correct Answer: Option C (It remains the same).

1. The overall average weight of the students of the class is given by:
   $$\text{Class Average Weight} = \frac{\text{Total weight of all students in the class}}{\text{Total number of students in the class}}$$
2. Shifting students between groups A, B, and C within the same class is purely an internal rearrangement.
3. The total weight of all students and the total count of students in the class remain completely unchanged.

Therefore, the average weight of the students of the class remains the same.', 'सही उत्तर: विकल्प C (यह वही रहेगा)।

1. पूरी कक्षा के विद्यार्थियों के औसत भार का सूत्र:
   $$\text{कक्षा का औसत भार} = \frac{\text{कक्षा के सभी विद्यार्थियों का कुल भार}}{\text{कक्षा के विद्यार्थियों की कुल संख्या}}$$
2. एक ही कक्षा के भीतर विद्यार्थियों को समूह A और B से समूह C में स्थानांतरित करने से पूरी कक्षा के कुल भार और विद्यार्थियों की कुल संख्या में कोई परिवर्तन नहीं होता।

अतः कक्षा के विद्यार्थियों का औसत भार वही रहेगा।', NULL),
    ('csat-2020-q60', 60, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Combinatorial Sums & Currency Denomination Counting', 'क्रमचय-संचय योग एवं मुद्रा मूल्यवर्ग गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Permutation & Combination', 'Combinatorics', 'Distinct Sums']::TEXT[], 'How many different sums can be formed with the denominations ₹50, ₹100, ₹200, ₹500 and ₹2,000 taking at least three denominations at a time?', 'मूल्यवर्गों ₹50, ₹100, ₹200, ₹500 और ₹2,000 के साथ, एक समय में कम-से-कम तीन मूल्यवर्गों को लेते हुए, कितनी विभिन्न धनराशियाँ बनाई जा सकती हैं?', '16', '15', '14', '10', '16', '15', '14', '10', 'A', 'Correct Answer: Option A (16).

1. We are given $n = 5$ distinct denominations: $\{50, 100, 200, 500, 2000\}$.
2. "At least three denominations at a time" means selecting subsets of size 3, 4, or 5:
   * Selecting 3 denominations: $\binom{5}{3} = 10$
   * Selecting 4 denominations: $\binom{5}{4} = 5$
   * Selecting 5 denominations: $\binom{5}{5} = 1$
3. Total number of combinations $= 10 + 5 + 1 = 16$.
4. Because all denominations are widely spaced positive integers, every unique subset yields a distinct total sum.

Therefore, 16 different sums can be formed.', 'सही उत्तर: विकल्प A (16)।

1. कुल $n = 5$ भिन्न मूल्यवर्ग दिए गए हैं: $\{50, 100, 200, 500, 2000\}$।
2. "कम-से-कम तीन मूल्यवर्ग" लेने का अर्थ है 3, 4 या 5 मूल्यवर्गों के संचय (Combinations) बनाना:
   * 3 मूल्यवर्गों को चुनना $= \binom{5}{3} = 10$
   * 4 मूल्यवर्गों को चुनना $= \binom{5}{4} = 5$
   * 5 मूल्यवर्गों को चुनना $= \binom{5}{5} = 1$
3. कुल विभिन्न धनराशियों की संख्या $= 10 + 5 + 1 = 16$।
4. चूँकि प्रत्येक संयोजन से बनने वाली कुल राशि का मान भिन्न और अद्वितीय है, अतः कुल 16 विभिन्न धनराशियाँ बनेंगी।

अतः 16 सही उत्तर है।', NULL),
    ('csat-2020-q61', 61, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Passage Inference on Banking System Non-Performing Assets (NPAs)', 'बैंकिंग प्रणाली में गैर-निष्पादित परिसंपत्तियों (NPA) पर निष्कर्ष', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Banking Sector', 'Financial Stability']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Bank credit to the industrial sector has started shrinking. Its decline has been a serious concern as credit growth is essential to revive investment. The problem''s origins lie in the incomplete reforms of the last 25 years. An institutional change that should have followed the 1991 reforms should have been setting up of a resolution corporation for banks. In a market economy with booms and busts, banks should be allowed to be set up and to fail. Today, we cannot shut down banks because there is no proper system to shut them down. Weak loss-making banks continue to need more capital.

Which one of the following is the most logical and rational inference that can be made from the above passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
औद्योगिक सेक्टर को मिलने वाले बैंक ऋण में संकुचन प्रारंभ हो गया है। इसमें कमी गंभीर चिंता का विषय है क्योंकि ऋण का प्रसार निवेश को पुनर्जीवित करने के लिए आवश्यक है। समस्या के उद्गम पिछले 25 वर्षों के अपूर्ण सुधारों में निहित हैं। 1991 के सुधारों के उपरांत बैंकों के लिए समाधान निगम की स्थापना का एक संस्थागत परिवर्तन होना चाहिए था। तेजी और मंदी वाली एक बाजार अर्थव्यवस्था में बैंकों को स्थापित करने एवं उन्हें असफल होने की अनुमति होनी चाहिए। आज हम बैंकों को बंद नहीं कर सकते क्योंकि उन्हें बंद करने की कोई उचित व्यवस्था नहीं है। कमजोर, हानि में रहने वाले बैंकों को निरंतर अधिक पूँजी की आवश्यकता होती है।

उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?', 'Indian banking system is not able to help the country in its economic growth.', 'Economic reforms that started in 1991 have not helped in improving the economy to expected levels.', 'India lacks the institutional mechanism to deal with the failure of banks.', 'Encouraging the foreign investments in our industrial sector is a good alternative to this sector''s dependence on banks for credit.', 'भारतीय बैंकिंग व्यवस्था देश की आर्थिक विकास में मदद नहीं कर पा रही है।', '1991 में प्रारंभ किए गए आर्थिक सुधारों ने अर्थव्यवस्था के अपेक्षित स्तर तक सुधार में सहायता नहीं की है।', 'भारत में बैंकों की असफलता से निपटने के लिए संस्थागत प्रक्रिया नहीं है।', 'औद्योगिक सेक्टर में विदेशी निवेश को प्रोत्साहन देना उस सेक्टर के बैंक ऋण के ऊपर निर्भरता का एक अच्छा विकल्प है।', 'C', 'Correct Answer: Option C (India lacks the institutional mechanism to deal with the failure of banks).

1. Why Option C is correct: The passage explicitly states that an institutional resolution corporation should have been established to handle bank failures following the 1991 reforms, and directly points out that "today, we cannot shut down banks because there is no proper system to shut them down."
2. Why Option A is incorrect: The passage discusses a credit slowdown to industry due to unresolved banking legacy issues, but does not claim that the banking system is fundamentally incapable of aiding growth.
3. Why Option B is incorrect: The passage critiques specific incomplete institutional reforms related to banking resolution, rather than generalizing that the entire 1991 reform process failed.
4. Why Option D is incorrect: Replacing bank credit with foreign direct investment in the industrial sector is an external policy recommendation not mentioned or implied in the text.

Therefore, option C is the most logical and rational inference.', 'सही उत्तर: विकल्प C (भारत में बैंकों की असफलता से निपटने के लिए संस्थागत प्रक्रिया नहीं है)।

1. विकल्प C क्यों सही है: परिच्छेद में स्पष्ट रूप से कहा गया है कि 1991 के सुधारों के बाद बैंकों के लिए एक ''समाधान निगम'' (resolution corporation) की स्थापना होनी चाहिए थी, और वर्तमान स्थिति यह है कि "आज हम बैंकों को बंद नहीं कर सकते क्योंकि उन्हें बंद करने की कोई उचित व्यवस्था नहीं है।"
2. विकल्प A क्यों गलत है: परिच्छेद औद्योगिक ऋण में कमी और सुधारों की कमियों पर केंद्रित है; यह पूरी बैंकिंग व्यवस्था को आर्थिक विकास में असमर्थ घोषित नहीं करता।
3. विकल्प B क्यों गलत है: परिच्छेद 1991 के बाद के कुछ अधूरे संस्थागत सुधारों को रेखांकित करता है, यह 1991 के सम्पूर्ण आर्थिक सुधारों को अप्रभावी नहीं बताता।
4. विकल्प D क्यों गलत है: औद्योगिक क्षेत्र के लिए बैंक ऋण के स्थान पर विदेशी निवेश को विकल्प बनाने की बात परिच्छेद में कहीं नहीं कही गई है।

अतः विकल्प C सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष है।', NULL),
    ('csat-2020-q62', 62, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Air Pollution Dynamics & Meteorological Trapping', 'वायु प्रदूषण गतिशीलता एवं मौसम संबंधी अवरोध पर निष्कर्ष', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Air Pollution', 'Atmospheric Science']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India has tremendous potential for solar energy. We all realize that we have to stop burning fossil fuels to meet our energy needs. But certain renewable resources are still going through their cost curves and learning curves to get the required amount of output. The Indian Government has strongly committed to its targets of reducing emissions by 33 per cent by 2030, and towards this it has initiated a strong push towards a gas-based economy and has also invested heavily in renewable energy. However, business houses are wary of investing too heavily in renewable energy at a time when the technology is not yet ready.

Which one of the following is the most logical and rational inference that can be made from the above passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में सौर ऊर्जा की विशाल संभावना है। हम सभी यह अनुभव करते हैं कि हमें अपनी ऊर्जा प्राप्त करने के लिए फॉसिल इंधनों को जलाना रोकना होगा। परंतु कुछ नवीकरणीय संसाधन वांछित उत्पादन-स्तर को प्राप्त करने के लिए अभी भी अपने लागत वक्रों एवं प्रवीणता वक्रों से गुजर रहे हैं। भारत सरकार 2030 तक उत्सर्जन को 33 प्रतिशत कम करने के अपने लक्ष्य से दृढ़ रूप से प्रतिबद्ध है तथा उस दिशा में उसने गैस पर आधारित अर्थव्यवस्था को एक सशक्त प्रोत्साहन दिया है और नवीकरणीय ऊर्जा में भारी निवेश भी किया है। परंतु व्यापारी घराने, ऐसे समय में जब तकनीक अभी तक तैयार नहीं है, नवीकरणीय ऊर्जा में भारी निवेश करने में हिचकिचा रहे हैं।

उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?', 'India''s commitment to reduce emissions by 33% is unlikely to be achieved.', 'India should import gas rather than invest in renewable resources.', 'Getting renewable resources to market too soon may be costly.', 'India should put in more efforts in the exploration of natural gas.', 'उत्सर्जन को 33% घटाने की भारत की प्रतिबद्धता को प्राप्त करना असम्भाव्य है।', 'भारत को नवीकरणीय संसाधनों में निवेश करने के बजाय गैस का आयात करना चाहिए।', 'नवीकरणीय संसाधनों को बहुत जल्दी बाजार में लाना महँगा हो सकता है।', 'भारत को प्राकृतिक गैस की खोज में अधिक प्रयत्न करना चाहिए।', 'C', 'Correct Answer: Option C (Getting renewable resources to market too soon may be costly).

1. Why Option C is correct: The passage explains that certain renewable technologies are still navigating their "cost curves and learning curves" and that private businesses hesitate to invest heavily when technology is not yet mature, directly implying that rushing unready renewable resources to market prematurely can be economically costly.
2. Why Option A is incorrect: The passage emphasizes the government''s strong commitment to the 2030 emission target; it does not claim that achieving this target is unlikely.
3. Why Option B is incorrect: The passage notes that the government promotes a gas-based economy alongside renewable investments; it does not suggest importing gas instead of investing in renewables.
4. Why Option D is incorrect: Accelerating domestic natural gas exploration is not mentioned or implied in the text.

Therefore, option C is the most logical and rational inference.', 'सही उत्तर: विकल्प C (नवीकरणीय संसाधनों को बहुत जल्दी बाजार में लाना महँगा हो सकता है)।

1. विकल्प C क्यों सही है: परिच्छेद बताता है कि कई नवीकरणीय संसाधन अभी अपनी ''लागत वक्रों एवं प्रवीणता वक्रों'' (learning curves) से गुजर रहे हैं और तकनीक परिपक्व न होने के कारण कंपनियाँ भारी निवेश से हिचकिचा रही हैं। इससे यह स्पष्ट निष्कर्ष निकलता है कि अपरिपक्व नवीकरणीय संसाधनों को बाज़ार में बहुत जल्दी लाना महँगा हो सकता है।
2. विकल्प A क्यों गलत है: परिच्छेद सरकार की दृढ़ प्रतिबद्धता को दर्शाता है, यह लक्ष्य प्राप्ति को असंभव या असंभाव्य नहीं बताता।
3. विकल्प B क्यों गलत है: परिच्छेद गैस-आधारित अर्थव्यवस्था के साथ-साथ नवीकरणीय ऊर्जा में भारी निवेश का उल्लेख करता है, यह नवीकरणीय संसाधनों को छोड़कर गैस आयात का सुझाव नहीं देता।
4. विकल्प D क्यों गलत है: प्राकृतिक गैस की खोज में अधिक प्रयास करने का विचार परिच्छेद में नहीं है।

अतः विकल्प C सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष है।', NULL),
    ('csat-2020-q63', 63, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Biomass Burning, Automation & Agricultural Subsidies', 'बायोमास दहन, स्वचालन एवं कृषि सब्सिडी संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Stubble Burning', 'Critical Assumptions']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India has tremendous potential for solar energy. We all realize that we have to stop burning fossil fuels to meet our energy needs. But certain renewable resources are still going through their cost curves and learning curves to get the required amount of output. The Indian Government has strongly committed to its targets of reducing emissions by 33 per cent by 2030, and towards this it has initiated a strong push towards a gas-based economy and has also invested heavily in renewable energy. However, business houses are wary of investing too heavily in renewable energy at a time when the technology is not yet ready.

With reference to the above passage, the following assumptions have been made:
1. Governments often provide inefficient and costly subsidies for technologies that may not be ready in the near future.
2. India''s commitment of reducing emissions by 33% by 2030 shall be on the basis of gas-based economy.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में सौर ऊर्जा की विशाल संभावना है। हम सभी यह अनुभव करते हैं कि हमें अपनी ऊर्जा प्राप्त करने के लिए फॉसिल इंधनों को जलाना रोकना होगा। परंतु कुछ नवीकरणीय संसाधन वांछित उत्पादन-स्तर को प्राप्त करने के लिए अभी भी अपने लागत वक्रों एवं प्रवीणता वक्रों से गुजर रहे हैं। भारत सरकार 2030 तक उत्सर्जन को 33 प्रतिशत कम करने के अपने लक्ष्य से दृढ़ रूप से प्रतिबद्ध है तथा उस दिशा में उसने गैस पर आधारित अर्थव्यवस्था को एक सशक्त प्रोत्साहन दिया है और नवीकरणीय ऊर्जा में भारी निवेश भी किया है। परंतु व्यापारी घराने, ऐसे समय में जब तकनीक अभी तक तैयार नहीं है, नवीकरणीय ऊर्जा में भारी निवेश करने में हिचकिचा रहे हैं।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. सरकार प्रायः ऐसी तकनीक पर अक्षम एवं महँगी आर्थिक सहायता देती है जो निकट भविष्य के लिए तैयार नहीं हो सकती।
2. 2030 तक उत्सर्जन में 33% कटौती की भारत की प्रतिबद्धता गैस-आधारित अर्थव्यवस्था पर निर्भर होगी।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'A', 'Correct Answer: Option A (1 only).

1. Why Assumption 1 is valid: The passage contrasts the government''s heavy push and investment in unready renewable technologies against the cautious stance of private business houses, validating the underlying assumption that governments often direct costly support into nascent technologies before they are commercially viable.
2. Why Assumption 2 is invalid: The passage states that the government is utilizing a push towards a gas-based economy along with heavy investments in renewable energy, so assuming that the entire 33% reduction target relies solely on a gas-based economy is an overstatement.

Therefore, only assumption 1 is valid.', 'सही उत्तर: विकल्प A (केवल 1)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद दर्शाता है कि सरकार उन नवीकरणीय तकनीकों में भारी निवेश कर रही है जो अभी पूरी तरह तैयार नहीं हैं और जिनसे निजी क्षेत्र हिचकिचा रहा है, जो यह पूर्वधारणा बनाती है कि सरकारें प्रायः ऐसी तकनीकों पर महँगी सहायता प्रदान करती हैं।
2. पूर्वधारणा 2 क्यों अवैध है: परिच्छेद में गैस-आधारित अर्थव्यवस्था के साथ-साथ नवीकरणीय ऊर्जा में भी भारी निवेश की बात कही गई है; अतः यह मानना कि पूरी 33% कटौती केवल गैस-आधारित अर्थव्यवस्था पर ही निर्भर होगी, सही नहीं है।

अतः केवल पूर्वधारणा 1 वैध है।', NULL),
    ('csat-2020-q64', 64, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Assumptions on Intellectual Property Rights & Traditional Knowledge', 'बौद्धिक संपदा अधिकार एवं पारंपरिक ज्ञान संबंधी पूर्वधारणाएँ', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Intellectual Property', 'Biopiracy']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
Genome editing is different from genome modification. Genome editing typically involves finding the part of a plant genome that could be changed to render it less vulnerable to disease, or resistant to certain herbicides, or to increase yields. Researchers use ''molecular scissors'' to dissect the genome and repair it, which is a process that occurs naturally when plants are under attack from diseases and can throw up new mutations that enable the plant to survive future attacks. This evolutionary process can effectively be speeded up now that it is possible to examine plant genomes in detail in laboratories, and create mechanisms through which the relevant genes can be altered very precisely.

With reference to the above passage, the following assumptions have been made:
1. Genome editing does not require the transfer of genes from one plant to another.
2. Through genome editing, the chosen genes can be altered precisely in a manner akin to the natural process that helps plants to adapt to the environmental factors.
Which of the above assumptions is/are valid?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जीनोम संपादन, जीनोम रूपांतरण से भिन्न है। जीनोम संपादन विशेष रूप से पादप जीनोम के उस भाग का पता लगाने से संबंधित है जिसको परिवर्तित किया जा सके जिससे रोग की भेद्यता कम की जा सके या कुछ शाकनाशियों के विरुद्ध प्रतिरोधी बनाया जा सके या उत्पादकता बढ़ाई जा सके। शोधकर्ता जीनोम का विच्छेदन करने के लिए ''आण्विक कैंची'' का उपयोग करते हैं और इसकी मरम्मत करते हैं जो कि पादपों में होने वाली वह प्राकृतिक प्रक्रिया है, जो पादप रोगों के आक्रमण के अधीन होने पर नए उत्परिवर्तनों को उत्पन्न कर सकती है, जो कि उस पादप को भविष्य में होने वाले आक्रमणों से बचे रहने में सक्षम बनाता है। अब जबकि प्रयोगशालाओं में पादप जीनोम का विस्तार से परीक्षण करना संभव है और संगत जीनों को सुस्पष्ट रूप में परिवर्तित करने की क्रियाविधि का सृजन किया जा सकता है, इस विकास प्रक्रिया में प्रभावी रूप से तेजी लाई जा सकती है।

उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जीनोम संपादन में एक पादप से दूसरे पर जीनों के स्थानांतरण की आवश्यकता नहीं है।
2. जीनोम संपादन के द्वारा चुनी हुई जीनों को सही रूप में एक प्राकृतिक प्रक्रिया के रूप में परिवर्तित किया जा सकता है जिससे पौधों को पर्यावरण तत्त्वों के साथ अनुकूलित होने में सहायता मिलती है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?', '1 only', '2 only', 'Both 1 and 2', 'Neither 1 nor 2', 'केवल 1', 'केवल 2', '1 और 2 दोनों', 'न तो 1, न ही 2', 'C', 'Correct Answer: Option C (Both 1 and 2).

1. Why Assumption 1 is valid: The passage distinguishes genome editing from modification by noting that editing involves altering and repairing the plant''s own internal genome using molecular scissors, rather than introducing foreign genes from other species.
2. Why Assumption 2 is valid: The text states that editing mimics and speeds up the natural evolutionary repair process that plants naturally undergo when attacked by diseases to generate survival mutations.

Therefore, both assumptions 1 and 2 are valid.', 'सही उत्तर: विकल्प C (1 और 2 दोनों)।

1. पूर्वधारणा 1 क्यों वैध है: परिच्छेद जीनोम संपादन को जीनोम रूपांतरण से भिन्न बताता है क्योंकि इसमें किसी अन्य पादप से जीन स्थानांतरित करने के बजाय पौधे के अपने ही जीनोम के विशिष्ट भाग को सुधारा जाता है।
2. पूर्वधारणा 2 क्यों वैध है: परिच्छेद स्पष्ट कहता है कि यह संपादन पादपों की उस प्राकृतिक प्रक्रिया के समान है जो रोगों के आक्रमण के समय अनुकूलन और उत्तरजीविता हेतु नए उत्परिवर्तन उत्पन्न करती है।

अतः 1 और 2 दोनों पूर्वधारणाएँ वैध हैं।', NULL),
    ('csat-2020-q65', 65, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Critical Message on Telemedicine & Rural Healthcare Access', 'टेलीमेडिसिन एवं ग्रामीण स्वास्थ्य सेवा पहुँच पर महत्वपूर्ण संदेश', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Healthcare', 'Telemedicine']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Many people understand the connection between solid waste management and health in terms of the consequences of unattended heaps of dry garbage which become home for flies and other vermin. However, there is another aspect that is not well-understood, that is, what happens when unscientific solid waste management combines with poor drainage and dumping of untreated sewage into drains which are meant to carry storm water during rains. The result is choked drains which are full of stagnant water breeding mosquitoes, resulting in the spread of water-borne diseases.

In the context of India, which one of the following statements best reflects the critical message of the passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
बहुत-से लोग ठोस अपशिष्ट प्रबंधन एवं स्वास्थ्य का संबंध ठोस कचरे के उपेक्षित ढेर के परिणाम के रूप में समझते हैं जो मक्खियों और कीड़े-मकोड़ों का घर बनते हैं। किन्तु एक दूसरा पक्ष भी है जिसे सही रूप में समझा नहीं जाता, कि क्या परिणाम होता है जब अवैज्ञानिक ठोस अपशिष्ट प्रबंधन के साथ ही जल निकास व्यवस्था खराब होती है और असंसाधित मल-जल को बारिश के पानी को ले जाने वाले नालों में छोड़ दिया जाता है। उसका परिणाम होता है नालों का अवरुद्ध हो जाना जिनमें रुका हुआ पानी भरा रहता है, मच्छर पैदा होते हैं तथा जल-जनित रोग फैलते हैं।

भारत के संदर्भ में, निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?', 'In India, the drainage networks are not separate for sewerage and storm water.', 'Urban local bodies do not have enough resources and legislative authority to deal with the problems of waste management.', 'Solid waste management should be integrated with the maintenance of drainage and sewerage networks.', 'Bad management of solid waste and sewerage systems by our municipalities is the reason for drinking water shortages in our cities.', 'भारत में जल-निकासी तंत्र बारिश के पानी एवं मल-जल के लिए अलग-अलग नहीं हैं।', 'शहरी स्थानीय निकायों के पास अपशिष्ट प्रबंधन की समस्याओं से निपटने के लिए पर्याप्त संसाधन एवं विधायी शक्तियाँ नहीं हैं।', 'ठोस अपशिष्ट प्रबंधन को जल-निकासी और मल-जल निकासी तंत्र के अनुरक्षण के साथ एकीकृत किया जाना चाहिए।', 'हमारी नगरपालिकाओं द्वारा ठोस अपशिष्ट एवं मल-जल प्रणालियों का खराब प्रबंधन हमारे शहरों में पेय जल की कमी के लिए जिम्मेदार है।', 'C', 'Correct Answer: Option C (Solid waste management should be integrated with the maintenance of drainage and sewerage networks).

1. Why Option C is correct: The passage explains that public health risks multiply when unscientific solid waste disposal interacts with poor drainage and sewage discharge into storm drains, causing choked drains and disease outbreaks. This directly implies that solid waste management must be integrated with the upkeep of drainage and sewerage networks.
2. Why Option A is incorrect: The passage notes that storm drains are inappropriately used to dump sewage, not that separate networks do not exist in design.
3. Why Option B is incorrect: Lack of resources and legislative authority of municipal bodies is not discussed in the text.
4. Why Option D is incorrect: The passage links choked drains to mosquito breeding and water-borne diseases, not to drinking water shortages.

Therefore, option C best reflects the critical message.', 'सही उत्तर: विकल्प C (ठोस अपशिष्ट प्रबंधन को जल-निकासी और मल-जल निकासी तंत्र के अनुरक्षण के साथ एकीकृत किया जाना चाहिए)।

1. विकल्प C क्यों सही है: परिच्छेद स्पष्ट करता है कि स्वास्थ्य समस्याएँ तब गंभीर होती हैं जब अवैज्ञानिक ठोस अपशिष्ट प्रबंधन खराब जल-निकासी और नालों में सीवेज डंपिंग के साथ मिल जाता है, जिससे नाले अवरुद्ध होते हैं और मच्छर व बीमारियाँ फैलती हैं। अतः ठोस अपशिष्ट और जल-निकासी तंत्र का एकीकृत प्रबंधन ही इसका मुख्य समाधान है।
2. विकल्प A क्यों गलत है: परिच्छेद नालों में अनुचित सीवेज बहाने का उल्लेख करता है, यह अलग नेटवर्क न होने का दावा नहीं करता।
3. विकल्प B क्यों गलत है: नगरपालिकाओं के संसाधनों और विधायी शक्तियों की कमी का परिच्छेद में कोई उल्लेख नहीं है।
4. विकल्प D क्यों गलत है: परिच्छेद का संबंध जल-जनित रोगों और मच्छरों से है, पेय जल की कमी से नहीं।

अतः विकल्प C परिच्छेद के क्रांतिक संदेश को सर्वोत्तम रूप से दर्शाता है।', NULL),
    ('csat-2020-q66', 66, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Reading Comprehension & Interpersonal Skills', 'बोधगम्यता एवं अंतर-वैयक्तिक कौशल', 'Inference on Early Childhood Malnutrition & Cognitive Development', 'बाल्यावस्था कुपोषण एवं संज्ञानात्मक विकास पर निष्कर्ष', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Reading Comprehension', 'Child Health', 'Cognitive Development']::TEXT[], 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In Part III of the Constitution, which assures people certain fundamental rights, Article 25 proclaims that "all persons are equally entitled to freedom of conscience and the right freely to profess, practise and propagate religion". What people fail to notice is that this proclamation is prefixed with the words "subject to public order, morality, health and to the other provisions of this Part", which set conditions precedent for the legal protection of religious practices of any community. The closing words of this prefatory rider in Article 25 virtually constitute a subordination clause placing other fundamental rights mentioned in Part III over and above the right to religious freedom. Among those other fundamental rights is the right to equality before law and equal protection of laws—assured at the outset and elaborated in later articles to mean, inter alia, that the State shall not deny equal protection of laws to any person or group of persons on the basis of religion alone.

What is the most logical inference from the above passage?', 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
संविधान के भाग III में, जो जनसाधारण को कुछ मौलिक अधिकारों के प्रति आश्वस्त करता है, अनुच्छेद 25 उद्घोषणा करता है कि "सभी व्यक्तियों को अंतःकरण की स्वतंत्रता का और धर्म के अबाध रूप से मानने, आचरण करने और प्रचार करने का समान हक़ होगा", लेकिन जिस बात पर लोग प्रायः ध्यान नहीं देते हैं वह है इस उद्घोषणा का इन शब्दों वाला उपसर्ग, "लोक व्यवस्था, सदाचार, स्वास्थ्य तथा इस भाग के अन्य उपबंधों के अधीन रहते हुए"। यह उपसर्ग किसी समुदाय के धार्मिक आचरण के वैधानिक संरक्षण की पूर्व शर्तें निर्धारित करता है। अनुच्छेद 25 की इस प्रारंभिक शर्त के अंतिम शब्द वस्तुतः एक अधीनस्थ खण्ड की संरचना करते हैं जिसके अनुसार भाग III में वर्णित अन्य मौलिक अधिकारों को धार्मिक स्वतंत्रता के अधिकार के ऊपर प्रधानता मिलती है। उन अन्य मौलिक अधिकारों में विधि के समक्ष समता का अधिकार और स्वयं विधियों के भी समान संरक्षण का अधिकार है- जिनका प्रारंभ में ही आश्वासन है तथा बाद के अनुच्छेदों में इस अर्थ के साथ विस्तार है कि, अन्य बातों के साथ, राज्य किसी भी व्यक्ति या व्यक्तियों के समूह को केवल धर्म के आधार पर विधियों के समान संरक्षण से वंचित नहीं करेगा।

उपर्युक्त परिच्छेद का सर्वाधिक तार्किक निष्कर्ष क्या है?', 'State shall not interfere with the religious affairs of the citizens.', 'Religious freedom under the Constitution is open to State intervention.', 'Religious freedom of the citizens is not covered under fundamental rights.', 'Religious practices of any community are immune to State laws.', 'राज्य नागरिकों के धार्मिक मामलों में हस्तक्षेप नहीं करेगा।', 'संविधान में दी गई धार्मिक स्वतंत्रता में राज्य हस्तक्षेप कर सकता है।', 'नागरिकों की धार्मिक स्वतंत्रता मौलिक अधिकारों के दायरे में नहीं आती।', 'किसी भी समुदाय के धार्मिक आचरण राज्य के कानूनों से प्रतिरक्षित हैं।', 'B', 'Correct Answer: Option B (Religious freedom under the Constitution is open to State intervention).

1. Why Option B is correct: The passage explains that Article 25 is expressly subject to public order, morality, health, and other Part III rights (such as equality before the law). This subordination clause directly empowers the State to regulate and intervene in religious practices to uphold these constitutional safeguards.
2. Why Option A is incorrect: The passage shows that the State can intervene when religious practices violate public order, morality, health, or equality.
3. Why Option C is incorrect: The passage opens by noting that Article 25 is part of Part III of the Constitution, confirming that religious freedom is a fundamental right.
4. Why Option D is incorrect: The passage refutes immunity by explicitly discussing the legal conditions and subordination clause governing religious practices.

Therefore, option B is the most logical inference.', 'सही उत्तर: विकल्प B (संविधान में दी गई धार्मिक स्वतंत्रता में राज्य हस्तक्षेप कर सकता है)।

1. विकल्प B क्यों सही है: परिच्छेद रेखांकित करता है कि अनुच्छेद 25 में धार्मिक स्वतंत्रता ''लोक व्यवस्था, सदाचार, स्वास्थ्य तथा भाग III के अन्य उपबंधों'' के अधीन है, जिसका अर्थ है कि समता और अन्य मौलिक अधिकारों की रक्षा हेतु राज्य धार्मिक मामलों में हस्तक्षेप और विनियमन कर सकता है।
2. विकल्प A क्यों गलत है: परिच्छेद स्पष्ट करता है कि धार्मिक स्वतंत्रता निरपेक्ष नहीं है और राज्य का हस्तक्षेप संभव है।
3. विकल्प C क्यों गलत है: परिच्छेद स्वयं बताता है कि अनुच्छेद 25 संविधान के भाग III (मौलिक अधिकार) का हिस्सा है।
4. विकल्प D क्यों गलत है: परिच्छेद के अनुसार धार्मिक आचरण राज्य के कानूनों से प्रतिरक्षित (immune) नहीं हैं।

अतः विकल्प B सर्वाधिक तार्किक निष्कर्ष है।', NULL),
    ('csat-2020-q67', 67, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Word Permutations with Letter Repetition & Distinct Combinations', 'पुनरावर्ती अक्षरों से शब्द निर्माण एवं क्रमचय गणना', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Permutation & Combination', 'Arrangements', 'Word Formation']::TEXT[], 'How many different 5-letter words (with or without meaning) can be constructed using all the letters of the word ''DELHI'' so that each word has to start with D and end with I?', 'शब्द ''DELHI'' के सभी अक्षरों का प्रयोग करते हुए कितने विभिन्न 5-अक्षरी शब्द (जिनका कोई अर्थ हो या न हो) बनाए जा सकते हैं, जबकि प्रत्येक शब्द D के साथ शुरू होता है और I के साथ समाप्त होता है?', '24', '18', '12', '6', '24', '18', '12', '6', 'D', 'Correct Answer: Option D (6).

1. The word ''DELHI'' consists of 5 distinct letters: {D, E, L, H, I}.
2. The first letter is fixed as ''D'' (1 way) and the fifth letter is fixed as ''I'' (1 way).
3. The remaining 3 middle positions must be filled by the remaining 3 letters {E, L, H}.
4. Number of permutations = $3! = 3 \times 2 \times 1 = 6$.

Therefore, 6 different 5-letter words can be constructed.', 'सही उत्तर: विकल्प D (6)।

1. शब्द ''DELHI'' में 5 भिन्न अक्षर {D, E, L, H, I} हैं।
2. शब्द का पहला अक्षर ''D'' और अंतिम अक्षर ''I'' निश्चित (fixed) है।
3. मध्य के 3 स्थानों को भरने के लिए शेष 3 अक्षरों {E, L, H} का क्रमचय करना होगा।
4. 3 अक्षरों को व्यवस्थित करने के कुल तरीके = $3! = 3 \times 2 \times 1 = 6$।

अतः कुल 6 विभिन्न शब्द बनाए जा सकते हैं।', NULL),
    ('csat-2020-q68', 68, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Repeated Liquid Replacement & Mixture Dilution Formula', 'क्रमिक द्रव प्रतिस्थापन एवं मिश्रण तनुकरण सूत्र', 'medium', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Mixtures & Alligations', 'Replacement Formula']::TEXT[], 'A bottle contains 20 litres of liquid A. 4 litres of liquid A is taken out of it and replaced by same quantity of liquid B. Again 4 litres of the mixture is taken out and replaced by same quantity of liquid B. What is the ratio of quantity of liquid A to that of liquid B in the final mixture?', 'एक बोतल में द्रव A की 20 लीटर मात्रा है। इसमें से द्रव A की 4 लीटर मात्रा बाहर निकाल दी जाती है और द्रव B की उतनी ही मात्रा वापस डाल दी जाती है। फिर से मिश्रण की 4 लीटर मात्रा बाहर निकाल दी जाती है और द्रव B की उतनी ही मात्रा वापस डाल दी जाती है। अंतिम मिश्रण में द्रव A की मात्रा का द्रव B की मात्रा से अनुपात क्या है?', '4:1', '5:1', '16:9', '17:8', '4:1', '5:1', '16:9', '17:8', 'C', 'Correct Answer: Option C (16:9).

1. Initial volume of liquid A is $V = 20\text{ L}$, and the volume removed and replaced each time is $x = 4\text{ L}$.
2. After $n = 2$ replacements, the remaining quantity of liquid A is:
   $$\text{Quantity of A} = V \left(1 - \frac{x}{V}\right)^n = 20 \left(1 - \frac{4}{20}\right)^2 = 20 \left(\frac{4}{5}\right)^2 = 20 \times \frac{16}{25} = 12.8\text{ litres}$$
3. Quantity of liquid B in the 20-litre mixture:
   $$\text{Quantity of B} = 20 - 12.8 = 7.2\text{ litres}$$
4. Ratio of liquid A to liquid B:
   $$\frac{\text{Quantity of A}}{\text{Quantity of B}} = \frac{12.8}{7.2} = \frac{128}{72} = \frac{16}{9}$$

Therefore, the ratio of liquid A to liquid B is 16:9.', 'सही उत्तर: विकल्प C (16:9)।

1. द्रव A की प्रारंभिक मात्रा $V = 20$ लीटर तथा निकाली गई मात्रा $x = 4$ लीटर है।
2. 2 बार प्रतिस्थापन के बाद द्रव A की शेष मात्रा:
   $$\text{A की मात्रा} = 20 \left(1 - \frac{4}{20}\right)^2 = 20 \times \frac{16}{25} = 12.8 \text{ लीटर}$$
3. 20 लीटर के मिश्रण में द्रव B की मात्रा $= 20 - 12.8 = 7.2 \text{ लीटर}$।
4. द्रव A और द्रव B का अनुपात:
   $$\text{A} : \text{B} = 12.8 : 7.2 = 128 : 72 = 16 : 9$$

अतः अंतिम मिश्रण में द्रव A और B का अनुपात 16:9 है।', NULL),
    ('csat-2020-q69', 69, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Batting Averages Progression & Score Calculation', 'बल्लेबाजी औसत संवृद्धि एवं पारी स्कोर गणना', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Averages', 'Sports Arithmetic']::TEXT[], 'The average score of a batsman after his 50th innings was 46.4. After 60th innings, his average score increases by 2.6. What was his average score in the last ten innings?', 'एक बल्लेबाज का उसकी 50वीं पारी के बाद औसत स्कोर 46.4 था। 60वीं पारी के बाद, उसका औसत स्कोर 2.6 बढ़ जाता है। पिछली दस पारियों में उसका औसत स्कोर क्या था?', '122', '91', '62', '49', '122', '91', '62', '49', 'C', 'Correct Answer: Option C (62).

1. Total runs in the first 50 innings $= 50 \times 46.4 = 2320$.
2. New average after 60 innings $= 46.4 + 2.6 = 49.0$.
3. Total runs in 60 innings $= 60 \times 49.0 = 2940$.
4. Runs scored in the last 10 innings $= 2940 - 2320 = 620$.
5. Average score in the last ten innings $= \frac{620}{10} = 62$.

Therefore, his average score in the last ten innings was 62.', 'सही उत्तर: विकल्प C (62)।

1. 50 पारियों के बाद कुल रन $= 50 \times 46.4 = 2320$।
2. 60 पारियों के बाद नया औसत $= 46.4 + 2.6 = 49.0$ रन।
3. 60 पारियों के बाद कुल रन $= 60 \times 49.0 = 2940$।
4. अंतिम 10 पारियों के कुल रन $= 2940 - 2320 = 620$ रन।
5. अंतिम 10 पारियों का औसत स्कोर $= \frac{620}{10} = 62$।

अतः पिछली दस पारियों में उसका औसत स्कोर 62 था।', NULL),
    ('csat-2020-q70', 70, 2020, 2, 'upsc-cse', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता', 'Quantitative Aptitude & Basic Numeracy', 'मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)', 'Price Hike & Consumption Reduction (Expenditure Invariance)', 'मूल्य वृद्धि एवं उपभोग में कमी (व्यय अपरिवर्तनीयता)', 'easy', ARRAY['PYQ', 'UPSC 2020', 'CSAT', 'Paper 2', 'Basic Numeracy', 'Percentages', 'Price & Consumption']::TEXT[], 'As a result of 25% hike in the price of rice per kg, a person is able to purchase 6 kg less rice for ₹1,200. What was the original price of rice per kg?', 'चावल के प्रति किलो मूल्य में 25% की वृद्धि के परिणामस्वरूप, एक व्यक्ति ₹1,200 में 6 किलो कम चावल खरीद पाता है। चावल का प्रति किलो प्रारंभिक मूल्य क्या था?', '30', '40', '50', '60', '30', '40', '50', '60', 'B', 'Correct Answer: Option B (40).

1. Let the original price of rice per kg be $P$.
2. Original quantity purchased for ₹1,200 $= \frac{1200}{P}$.
3. Increased price per kg $= 1.25 P$. New quantity purchased $= \frac{1200}{1.25 P} = \frac{960}{P}$.
4. Set up the difference equation:
   $$\frac{1200}{P} - \frac{960}{P} = 6 \implies \frac{240}{P} = 6 \implies P = \frac{240}{6} = 40$$

Therefore, the original price of rice per kg was ₹40.', 'सही उत्तर: विकल्प B (40)।

1. माना चावल का प्रारंभिक मूल्य $P$ रुपये प्रति किलो है।
2. ₹1,200 में खरीदी गई प्रारंभिक मात्रा $= \frac{1200}{P}$ किलो।
3. 25% मूल्य वृद्धि के बाद नया मूल्य $= 1.25 P$ रुपये। नई मात्रा $= \frac{1200}{1.25 P} = \frac{960}{P}$ किलो।
4. मात्रा का अंतर:
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

1. Statement 1 is incorrect: A circle and a square can be completely disjoint (0 intersection points) or mutually tangent at a single vertex/side (1 intersection point). Hence, the minimum number of intersection points is not 2.
2. Statement 2 is correct: A circle can intersect each of the 4 straight line segments (sides) of a square at a maximum of 2 points. Therefore, the maximum number of intersection points is $4 \times 2 = 8$.

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
2. Since $a, b \in \mathbb{N}$, $(a - b)$ and $(a + b)$ must be positive integer factors of 63 with $a - b < a + b$.
3. Factor pairs $(x, y)$ of 63 such that $x < y$:
   * **Pair 1**: $a - b = 1, a + b = 63 \implies 2a = 64 \implies a = 32, b = 31$
   * **Pair 2**: $a - b = 3, a + b = 21 \implies 2a = 24 \implies a = 12, b = 9$
   * **Pair 3**: $a - b = 7, a + b = 9 \implies 2a = 16 \implies a = 8, b = 1$
4. There are exactly 3 valid pairs of natural numbers: $(32, 31), (12, 9),$ and $(8, 1)$.

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

1. For any proper fraction $\frac{a}{b}$, the change when adding 5 to both numerator and denominator is:
   $$\Delta = \frac{a+5}{b+5} - \frac{a}{b} = \frac{5(b - a)}{b(b + 5)}$$
2. In all four given fractions $\frac{2}{3}, \frac{3}{4}, \frac{4}{5}, \frac{5}{6}$, the difference $(b - a) = 1$.
3. Thus, $\Delta = \frac{5}{b(b+5)}$. This change is minimized when the denominator $b(b+5)$ is largest.
4. Computing $\Delta$ for each fraction:
   * For $\frac{2}{3}$ ($b=3$): $\Delta = \frac{5}{3 \times 8} = \frac{5}{24} \approx 0.2083$
   * For $\frac{3}{4}$ ($b=4$): $\Delta = \frac{5}{4 \times 9} = \frac{5}{36} \approx 0.1389$
   * For $\frac{4}{5}$ ($b=5$): $\Delta = \frac{5}{5 \times 10} = \frac{5}{50} = 0.1000$
   * For $\frac{5}{6}$ ($b=6$): $\Delta = \frac{5}{6 \times 11} = \frac{5}{66} \approx 0.0758$

Therefore, 5/6 will have the minimum change in its value.', 'सही उत्तर: विकल्प D (5/6)।

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
2. Thus, $1000\text{ gm}$ of water corresponds to $10^6\text{ mm}^3$.
3. Find volume per gram of water:
   $$1\text{ gm of water} = \frac{10^6}{1000} = 1000\text{ mm}^3$$
4. Calculate volume for $0.1\text{ gm}$:
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

1. Let $V$ be the weight of the empty vessel and $W$ be the weight of water when the vessel is full.
2. Formulate equations from the given conditions:
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
2. In each regular jump, the frog ascends $30\text{ cm}$ and slips back $15\text{ cm}$, achieving a net progress of $30 - 15 = 15\text{ cm}$.
3. On the final jump, once the frog reaches or clears the top rim ($450\text{ cm}$), it escapes and does not slide back down.
4. Height to be covered before the final jump $= 450 - 30 = 420\text{ cm}$.
5. Number of jumps to reach $420\text{ cm} = \frac{420}{15} = 28\text{ jumps}$.
6. On the 29th jump, from $420\text{ cm}$, the frog leaps $30\text{ cm}$ and reaches $420 + 30 = 450\text{ cm}$ (the top of the well).

Therefore, the number of jumps required is 29.', 'सही उत्तर: विकल्प B (29)।

1. कुएँ की कुल गहराई $= 4.5 \text{ m} = 450 \text{ cm}$।
2. प्रत्येक सामान्य छलाँग में मेंढक 30 cm ऊपर जाता है और 15 cm नीचे सरकता है, अतः प्रति छलाँग शुद्ध प्रगति $= 30 - 15 = 15 \text{ cm}$।
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

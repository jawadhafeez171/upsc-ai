-- Migration: Add passage columns to csat_pyq and update existing 2020 CSAT reading comprehension questions
ALTER TABLE public.csat_pyq ADD COLUMN IF NOT EXISTS passage_english TEXT;
ALTER TABLE public.csat_pyq ADD COLUMN IF NOT EXISTS passage_hindi TEXT;

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
In India, over the last decade or so, labour has been departing agriculture, but is only going to construction and unregistered manufacturing which are not markedly better jobs. Services, where labour tends to be most productive, are not generating the additional jobs the country needs. India will need 24 million or so jobs over the next decade. The new sector, e-commerce, can at best close only half the jobs gap. Only those sectors that drive domestic demand such as health and education can comfortably fill the other half.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
भारत में, पिछले दशक अथवा उसके आसपास, श्रमिक कृषि से हट रहे हैं, परंतु वे केवल निर्माण तथा गैर-पंजीकृत विनिर्माण में, जो कि स्पष्टतः बेहतर रोज़गार अवसर नहीं है, जा रहे हैं। सेवाएँ, जहाँ श्रम की प्रवृत्ति अधिक उत्पादनकारी होती है, अतिरिक्त रोज़गार अवसर उत्पन्न नहीं कर रही हैं जिनकी देश को आवश्यकता है। भारत को अगले दशक में लगभग 24 मिलियन नौकरियों की आवश्यकता होगी। नया सेक्टर, ई-व्यापार, रोज़गार के अंतर को अधिक-से-अधिक आधा ही भर पाएगा। केवल वे सेक्टर, जो घरेलू माँग को बढ़ावा देते हैं, जैसे स्वास्थ्य तथा शिक्षा, शेष आधे भाग को सुगमतापूर्वक भर सकते हैं।',
    question_english = 'Which one of the following is best implied in the passage?',
    question_hindi = 'परिच्छेद में निम्नलिखित में से कौन-सा एक सर्वाधिक महत्त्वपूर्ण निहितार्थ है?'
WHERE (id = 'csat-2020-q1' OR (year = 2020 AND question_number = 1));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
In India, the current focus on the right to privacy is based on some new realities of the digital age. A right is a substantive right only if it works in all situations, and for everyone. A right to free expression for an individual about her exploitation, for instance, is meaningless without actual availability of security that guarantees that private force cannot be used to thwart this right. The role of the State, therefore, is not just to abstain from preventing rightful free expression, but also to actively ensure that private parties are not able to block it.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में निजता के अधिकार पर वर्तमान फोकस डिजिटल युग की कुछ नवीन वास्तविकताओं पर आधारित है। कोई भी अधिकार वास्तविक अधिकार तभी होता है यदि वह सभी स्थितियों में प्रभावी हो और सभी के लिए हो। उदाहरण के लिए, किसी व्यक्ति का अपने शोषण के विरुद्ध सुरक्षा की वास्तविक उपलब्धता के बिना स्वतंत्र अभिव्यक्ति का अधिकार अर्थहीन है, जो कि यह सुनिश्चित करे कि उसके इस अधिकार को गैर-सरकारी शक्ति के प्रयोग से निष्फल न किया जा सके। इसलिए राज्य की भूमिका आधिकारिक स्वतंत्र अभिव्यक्ति में रुकावट पैदा करने से बचना मात्र ही नहीं है अपितु यह भी सक्रिय रूप से सुनिश्चित करना है कि गैर-सरकारी पक्षकार इसको अवरुद्ध करने में सक्षम न हों।',
    question_english = 'On the basis of the above passage, the following assumptions have been made:
1. State should have some institutions to ensure its appropriate role in a digital society.
2. State should ensure that private parties do not violate the citizens'' right to privacy.
3. Digital economy is not compatible with the idea of not violating the citizens'' privacy.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के आधार पर निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. डिजिटल समाज में राज्य के पास ऐसी संस्थाएँ होनी चाहिए जो इसकी समुचित भूमिका को सुनिश्चित कर सकें।
2. राज्य को सुनिश्चित करना चाहिए कि गैर-सरकारी पक्षकार नागरिकों की निजता के अधिकार का हनन न करें।
3. डिजिटल अर्थव्यवस्था नागरिकों की निजता का हनन न करने के विचार से सुसंगत नहीं है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q2' OR (year = 2020 AND question_number = 2));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
One of the biggest ironies around water is that it comes from rivers and other wetlands. Yet it is seen as divorced from them. While water is used as a resource, public policy does not always grasp that it is a part of the natural ecosystem. Efforts at engineering water systems are thus efforts at augmenting water supply rather than strengthening the capacities of ecological systems.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जल के साथ एक सबसे बड़ी विडम्बना यह है कि यह नदियों एवं अन्य आर्द्रभूमियों से आता है। इसके बावजूद उसे, उनसे पृथक् माना जाता है। यद्यपि जल का प्रयोग एक संसाधन या वस्तु के रूप में किया जाता है, लोक नीति सदैव यह नहीं समझ पाती कि यह प्राकृतिक पारिस्थितिक तंत्र का एक हिस्सा है। अतएव जल प्रणाली निर्माण के प्रयास, जल की आपूर्ति में अभिवृद्धि के प्रयास हैं न कि पारिस्थितिक प्रणाली की क्षमताओं को मजबूत बनाने के।',
    question_english = 'Which one of the following is the most logical and rational inference that can be made from the above passage?',
    question_hindi = 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तर्कसंगत और विवेकपूर्ण निष्कर्ष निकाला जा सकता है?'
WHERE (id = 'csat-2020-q3' OR (year = 2020 AND question_number = 3));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Asset allocation is the most important investment decision we will ever make, and sadly, most of us do not give that decision the importance it deserves. We are adamant about seeking predictability with our future. We tend to think of investing in risky assets as extremely volatile and value eroding. We also dislike fluctuating returns and the loss of control of investment. We think our money is best left idle, unproductive but safe. There is no asset that is risk-free. We could lose our jobs, our homes can lose value, our banks can go bankrupt, our bonds can default, the government can collapse and companies we chose fondly may cease to exist. But we cannot live life assuming that all these extreme events are waiting to happen, and all at the same time. All these extreme forms of risks we know will not manifest at the same time.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
हमारे निवेश निर्णयों में से सबसे महत्त्वपूर्ण होता है संपत्ति का विनिधान, और दुःख की बात है कि हम में से अधिकांश इस निर्णय को उतना महत्त्व नहीं देते जितना वांछित है। हम अपने भविष्य की पूर्वानुमेयता तलाशने के लिए अडिग हैं। हमारी सोच जोखिम-भरी संपत्तियों में निवेश के लिए अत्यधिक चपल एवं मूल्य क्षयण के प्रति अभिमुखित है। हम निवेश के अस्थिर प्रतिफल एवं नियंत्रण-लोप को भी पसंद नहीं करते। हम सोचते हैं कि हमारे धन का निष्क्रिय, अनुत्पादक रहना बेहतर है, पर वह सुरक्षित रहे। परंतु ऐसी कोई संपत्ति नहीं है जो जोखिम-मुक्त हो। हम अपने रोज़गार खो सकते हैं, हमारे घर अपना मूल्य खो सकते हैं, हमारे बैंक दिवालिये हो सकते हैं, हमारे बॉन्ड भुगतान से चूक सकते हैं, सरकार गिर सकती है और हमारे मन मुताबिक चुनी हुई कम्पनियों का अस्तित्व समाप्त हो सकता है। पर हम यह मानकर जीवन नहीं जी सकते कि ये सभी चरम घटनाएँ और वो भी सभी एक साथ घटित होने के लिए तैयार बैठीं हैं। हम जानते हैं कि जोखिम के ये सभी चरम स्वरूप एक साथ प्रकट नहीं होंगे।',
    question_english = 'Which one of the following statements best implies the suggestion given by the author of the passage?',
    question_hindi = 'निम्न कथनों में से कौन-सा एक परिच्छेद के लेखक द्वारा दी गई सलाह को श्रेष्ठ रूप से निहित करता है?'
WHERE (id = 'csat-2020-q4' OR (year = 2020 AND question_number = 4));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Although most of the Genetically Modified (GM) crops cultivated now are genetically engineered for a single trait, in future, crops genetically engineered for more than one trait will be the norm. Thus, biotechnology''s role in agriculture and the regulation of the same cannot be understood solely in the context of the current generation of GM crops. Instead, there is a need to take a comprehensive look, taking into account various aspects, including socio-economic impacts, so that the potential of the technology can be harnessed while minimizing negative impacts. Given the importance of biotechnology in developing varieties that can help in climate change mitigation and adaptation, not using biotechnology as a part of the climate change action plan cannot be an option. Domestic regulation of biotechnology cannot be viewed in isolation of trade policy and obligations under various international treaties and conventions.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
यद्यपि आजकल उगायी जाने वाली अधिकतर आनुवंशिकतः रूपांतरित (जी० एम०) फसलें एकल लक्षण के लिए आनुवंशिकतः अभिरचित हैं, भविष्य में फसलों का एक से अधिक लक्षणों के लिए आनुवंशिकतः अभिरचित होना सामान्य मानक होगा। अतः कृषि में जैव प्रौद्योगिकी की भूमिका और उसके नियमन को, अकेले जी० एम० फसलों की वर्तमान पीढ़ी के प्रसंग में नहीं समझा जा सकता। बल्कि विभिन्न पहलुओं को जिनमें सामाजिक-आर्थिक प्रभाव सम्मिलित हैं, ध्यान में रखते हुए एक व्यापक अवलोकन की आवश्यकता है, ताकि नकारात्मक प्रभावों को न्यूनीकृत करते हुए प्रौद्योगिकी की क्षमता का उपयोग किया जा सके। उन किस्मों के विकास में, जो जलवायु परिवर्तन के प्रशमन और अनुकूलन में मददगार हैं, जैव प्रौद्योगिकी के महत्त्व के आलोक में, जलवायु परिवर्तन की कार्य योजना के एक अंश के रूप में जैव प्रौद्योगिकी का उपयोग न करना, एक विकल्प नहीं हो सकता। जैव प्रौद्योगिकी के घरेलू नियमन को व्यापार नीति और विभिन्न अंतर्राष्ट्रीय संधियों तथा सम्मेलनों के अंतर्गत दायित्वों से अलग करके नहीं देखा जा सकता।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Biotechnology regulation is an evolving process.
2. Participation of people is needed in policy decisions regarding biotechnology regulation.
3. Biotechnology regulation should take into account socio-economic aspects in decision-making.
4. Wider involvement of political executive in biotechnology regulation improves its effectiveness in dealing with the country''s trade policies and international obligations.
Which of the above assumptions are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जैव प्रौद्योगिकी नियमन एक विकासशील प्रक्रिया है।
2. जैव प्रौद्योगिकी नियमन के विषय में नीति निर्णय के लिए लोगों की भागीदारी की आवश्यकता है।
3. जैव प्रौद्योगिकी नियमन के निर्णयन में सामाजिक-आर्थिक पहलुओं को भी ध्यान में रखना चाहिए।
4. जैव प्रौद्योगिकी नियमन में राजनैतिक कार्यपालिका का व्यापक रूप में शामिल होना देश की व्यापार नीतियों और अंतर्राष्ट्रीय दायित्वों को निपटाने की प्रभाविता में सुधार लाता है।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?'
WHERE (id = 'csat-2020-q5' OR (year = 2020 AND question_number = 5));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Although most of the Genetically Modified (GM) crops cultivated now are genetically engineered for a single trait, in future, crops genetically engineered for more than one trait will be the norm. Thus, biotechnology''s role in agriculture and the regulation of the same cannot be understood solely in the context of the current generation of GM crops. Instead, there is a need to take a comprehensive look, taking into account various aspects, including socio-economic impacts, so that the potential of the technology can be harnessed while minimizing negative impacts. Given the importance of biotechnology in developing varieties that can help in climate change mitigation and adaptation, not using biotechnology as a part of the climate change action plan cannot be an option. Domestic regulation of biotechnology cannot be viewed in isolation of trade policy and obligations under various international treaties and conventions.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
यद्यपि आजकल उगायी जाने वाली अधिकतर आनुवंशिकतः रूपांतरित (जी० एम०) फसलें एकल लक्षण के लिए आनुवंशिकतः अभिरचित हैं, भविष्य में फसलों का एक से अधिक लक्षणों के लिए आनुवंशिकतः अभिरचित होना सामान्य मानक होगा। अतः कृषि में जैव प्रौद्योगिकी की भूमिका और उसके नियमन को, अकेले जी० एम० फसलों की वर्तमान पीढ़ी के प्रसंग में नहीं समझा जा सकता। बल्कि विभिन्न पहलुओं को जिनमें सामाजिक-आर्थिक प्रभाव सम्मिलित हैं, ध्यान में रखते हुए एक व्यापक अवलोकन की आवश्यकता है, ताकि नकारात्मक प्रभावों को न्यूनीकृत करते हुए प्रौद्योगिकी की क्षमता का उपयोग किया जा सके। उन किस्मों के विकास में, जो जलवायु परिवर्तन के प्रशमन और अनुकूलन में मददगार हैं, जैव प्रौद्योगिकी के महत्त्व के आलोक में, जलवायु परिवर्तन की कार्य योजना के एक अंश के रूप में जैव प्रौद्योगिकी का उपयोग न करना, एक विकल्प नहीं हो सकता। जैव प्रौद्योगिकी के घरेलू नियमन को व्यापार नीति और विभिन्न अंतर्राष्ट्रीय संधियों तथा सम्मेलनों के अंतर्गत दायित्वों से अलग करके नहीं देखा जा सकता।',
    question_english = 'Which one of the following statements best implies the crux of the passage?',
    question_hindi = 'निम्नलिखित में से कौन-सा कथन परिच्छेद के मर्म को श्रेष्ठ रूप से अंतर्निहित करता है?'
WHERE (id = 'csat-2020-q6' OR (year = 2020 AND question_number = 6));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Private investment in general is volatile. Foreign private investment is more volatile because the available investment avenues are significantly greater (i.e., the entire world). Therefore, the responsibility of providing employment cannot be left to Foreign Direct Investment (FDI). The current FDI inflows are volatile over time and across sectors and regions, which is a necessary consequence of their search for the highest returns. The adverse consequences are unstable employment and an accentuation of income and regional inequalities. A probable positive consequence of foreign investment is the inflow of new technology and its subsequent diffusion. However, the technology diffusion is not at all certain because the existing state of physical and human capital in India may prove inadequate for the diffusion.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
निजी निवेश सामान्यतः चपल है। विदेशी निजी निवेश और भी अधिक चपल है क्योंकि उनके लिए उपलब्ध निवेश विकल्प काफी अधिक हैं (अर्थात्, समूचा संसार)। इसलिए रोज़गार देने का दायित्व विदेशी प्रत्यक्ष निवेश (FDI) पर नहीं छोड़ा जा सकता। सांप्रतिक FDI अंतर्वाह सभी समय और सभी सेक्टरों तथा क्षेत्रों के संदर्भ में चपल होता है, जो उनके अधिकतम प्रतिफल की तलाश का आवश्यक परिणाम है। अस्थिर रोज़गार और आय एवं क्षेत्रीय असमानताओं का प्रबलन उसके दुष्परिणाम हैं। विदेशी निवेश का एक संभावित सकारात्मक परिणाम है नई प्रौद्योगिकी का अंतर्वहन और उसका अनुवर्ती विसरण। तथापि, प्रौद्योगिकी विसरण एकदम सुनिश्चित नहीं है, क्योंकि विसरण के लिए भारत में भौतिक एवं मानवीय पूँजी की वर्तमान स्थिति अपर्याप्त साबित हो सकती है।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Relying on foreign investment in the long run is not an economically sound policy.
2. Policies must be undertaken to reduce volatility in foreign private investment.
3. Policies must be undertaken to strengthen domestic private investment.
4. Public investment should be given priority over private investment.
5. Substantial public investment in education and health should be undertaken.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. दीर्घकाल में विदेशी निवेश पर भरोसा करना आर्थिक रूप से एक सही नीति नहीं है।
2. ऐसी नीतियों को अपनाया जाना चाहिए जो विदेशी निजी निवेश में चपलता को कम कर सकें।
3. घरेलू निजी निवेश को सशक्त बनाने वाली नीतियाँ अपनायी जानी चाहिए।
4. निजी निवेश की अपेक्षा सार्वजनिक निवेश को अधिक प्राथमिकता देनी चाहिए।
5. शिक्षा एवं स्वास्थ्य क्षेत्र में पर्याप्त सार्वजनिक निवेश किया जाना चाहिए।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q21' OR (year = 2020 AND question_number = 21));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
Many opportunities to harness the highly skewed, seasonal and spatial distribution of monsoon flows, which occur in a four-month period from June to September annually, have been lost. Since these few months account for most of the rainfall and consequent freshwater availability, the need for holding rainwater in reservoirs, for subsequently releasing it for use over the year, is a necessity nobody can afford to overlook. Climate change will continue to affect weather conditions and create water shortages and excesses. While millions suffer from droughts and floods, waters in the country''s many rivers flow unutilized, and are discharged into the sea every year.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
प्रतिवर्ष जून से सितम्बर के चार महीनों के दौरान होने वाले मानसूनी प्रवाहों के अत्यधिक विषम, ऋतुनिष्ठ एवं स्थानिक वितरण के उपयोग के कई अवसरों को खोया जा चुका है। चूँकि इन कुछ महीनों में ही अधिकांश वृष्टि होती है एवं परिणामतः स्वच्छ जल उपलब्ध होता है, जलाशयों में वर्षा के जल के संचयन की आवश्यकता और बाद में वर्ष-भर उपयोग हेतु छोड़ना, एक ऐसी अनिवार्यता है जिसकी कोई उपेक्षा नहीं कर सकता। जलवायु परिवर्तन मौसम की स्थितियों को सदा प्रभावित करता रहेगा और जल की अल्पता तथा इसके आधिक्य को उत्पन्न करेगा। जहाँ लाखों लोग सूखे एवं बाढ़ से पीड़ित होते हैं वहीं देश की कई नदियों में पानी अप्रयुक्त बहता रहता है और प्रत्येक वर्ष समुद्र में बह जाता है।',
    question_english = 'With reference to the above passage, which of the following could be the most rational and practical implications for India?
1. Inter-linking of rivers should be undertaken.
2. A network of dams and canals should be built across the country for proper distribution of water.
3. Farmers should be provided easy loans for digging borewells.
4. Usage of water for agriculture should be regulated by law.
5. Distribution of river water among regions should be regulated by the Union Government.
Select the correct answer using the code given below.',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा भारत की दृष्टि से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ हो सकता है?
1. नदियों के अंतःसंबंधन को प्रारंभ किया जाना चाहिए।
2. जल के यथोचित वितरण के लिए पूरे देश में बाँधों एवं नहरों के नेटवर्क का निर्माण किया जाना चाहिए।
3. कृषकों को बोरवेल की खुदाई के लिए सुलभ ऋण दिया जाना चाहिए।
4. कृषि में जल के प्रयोग को कानूनी रूप से नियंत्रित किया जाना चाहिए।
5. केन्द्र सरकार द्वारा विभिन्न क्षेत्रों में नदियों के जल के वितरण को नियंत्रित किया जाना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।'
WHERE (id = 'csat-2020-q22' OR (year = 2020 AND question_number = 22));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
People will invest in education whenever they are granted the economic freedom to fully enjoy its benefits. Again, this is for the obvious reason that the return on education increases as the level of economic freedom rises. When people, thanks to lower tax rates, are allowed to retain most of the higher income that they gain from each incremental level of education, it makes eminent sense to invest in education. On the other hand, when the government decides to tax the higher income of educated individuals at even higher rates, it makes very little sense to invest in educating oneself further. The same incentives apply to parents who decide on whether to invest in their children''s education.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जब शिक्षा से मिलने वाले लाभ का उपयोग करने की आर्थिक स्वतंत्रता प्राप्त होगी, तभी लोग शिक्षा में निवेश करेंगे। इस प्रत्यक्ष कारण की वजह से आर्थिक स्वतंत्रता के स्तर में वृद्धि के साथ ही शिक्षा से प्राप्त होने वाला लाभ भी बढ़ जाता है। निम्न कर दरों के कारण जब लोगों को शिक्षा के प्रत्येक बढ़ते स्तर से प्राप्त बढ़ी हुई आय के अधिकांश भाग को अपने पास रखने की अनुमति होती है तब शिक्षा में निवेश एक अच्छी सूझ-बूझ की बात होती है। दूसरी ओर जब सरकार शिक्षित व्यक्तियों की बढ़ी हुई आय पर और ऊँची दरों पर कर लगाने का निर्णय लेती है, तब स्वयं को अधिक शिक्षित करने में निवेश करना समझदारी की बात नहीं लगती। यही प्रोत्साहन उन अभिभावकों पर भी लागू होता है जिन्हें यह निर्णय लेना है कि वे अपने बच्चों की शिक्षा पर निवेश करें या नहीं।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Lower tax rates in a country invariably translate into greater investments in higher education.
2. Investment in the education of children ensures their economic freedom.
3. Economic freedom has a positive impact on building up human capital.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. किसी देश में निम्न कर दर निरपवाद रूप से उच्च शिक्षा में अधिक निवेश के लिए परिणत हो जाती हैं।
2. बच्चों की शिक्षा में निवेश उनकी आर्थिक स्वतंत्रता को सुनिश्चित करता है।
3. आर्थिक स्वतंत्रता का मानव पूँजी निर्माण पर सकारात्मक प्रभाव होता है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q23' OR (year = 2020 AND question_number = 23));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Our urban bodies cannot possibly ensure sustainable delivery of water in our cities unless financing mechanisms are put in place. Water delivery requires heavy investment in collecting it from a natural source, treating it to make it potable, and laying a distribution network of pipes for delivery to the users. It also requires investments in sewerage infrastructure and sewage treatment plants so that the sewers can carry the wastewater to these plants to ensure that no untreated sewage is discharged back into natural water bodies. If our cities were rich enough to meet the entire cost, water could be delivered free. They are not.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
जब तक वित्तीयन तंत्र स्थापित न हो जाए तब तक हमारे शहरी निकाय संभवतः हमारे शहरों में जलापूर्ति की धारणीय व्यवस्था सुनिश्चित नहीं कर सकते। जलापूर्ति के लिए प्राकृतिक स्रोतों से जल संचित करने, उसे पीने योग्य बनाने की अभिक्रिया, तथा उपभोक्ताओं तक उसकी आपूर्ति करने के लिए पाइपों के जल-वितरण नेटवर्क बिछाने में भारी निवेश की आवश्यकता होती है। उसमें मल-प्रबंधन अधःसंरचना एवं मल-जल अभिक्रिया संयंत्रों में भी निवेश की आवश्यकता होती है, जिससे मल-प्रणाल अपशिष्ट जल को इन संयंत्रों तक ले जा सकें और यह सुनिश्चित किया जा सके कि असंसाधित मल-जल प्राकृतिक जल निकायों में बिलकुल ही नहीं छोड़ा जाए। यदि हमारे शहर इतने समृद्ध होते कि वो पूरी लागत को वहन कर सकते तो जल की निःशुल्क पूर्ति की जा सकती है। वे ऐसे नहीं हैं।',
    question_english = 'What is the most logical and crucial message conveyed by the passage?',
    question_hindi = 'परिच्छेद द्वारा संप्रेषित सर्वाधिक तार्किक और निर्णायक संदेश क्या है?'
WHERE (id = 'csat-2020-q24' OR (year = 2020 AND question_number = 24));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Our urban bodies cannot possibly ensure sustainable delivery of water in our cities unless financing mechanisms are put in place. Water delivery requires heavy investment in collecting it from a natural source, treating it to make it potable, and laying a distribution network of pipes for delivery to the users. It also requires investments in sewerage infrastructure and sewage treatment plants so that the sewers can carry the wastewater to these plants to ensure that no untreated sewage is discharged back into natural water bodies. If our cities were rich enough to meet the entire cost, water could be delivered free. They are not.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
जब तक वित्तीयन तंत्र स्थापित न हो जाए तब तक हमारे शहरी निकाय संभवतः हमारे शहरों में जलापूर्ति की धारणीय व्यवस्था सुनिश्चित नहीं कर सकते। जलापूर्ति के लिए प्राकृतिक स्रोतों से जल संचित करने, उसे पीने योग्य बनाने की अभिक्रिया, तथा उपभोक्ताओं तक उसकी आपूर्ति करने के लिए पाइपों के जल-वितरण नेटवर्क बिछाने में भारी निवेश की आवश्यकता होती है। उसमें मल-प्रबंधन अधःसंरचना एवं मल-जल अभिक्रिया संयंत्रों में भी निवेश की आवश्यकता होती है, जिससे मल-प्रणाल अपशिष्ट जल को इन संयंत्रों तक ले जा सकें और यह सुनिश्चित किया जा सके कि असंसाधित मल-जल प्राकृतिक जल निकायों में बिलकुल ही नहीं छोड़ा जाए। यदि हमारे शहर इतने समृद्ध होते कि वो पूरी लागत को वहन कर सकते तो जल की निःशुल्क पूर्ति की जा सकती है। वे ऐसे नहीं हैं।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Rich cities only can ensure sustainable delivery of water.
2. Sustainable delivery of water in cities means much more than supplying water to households.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. केवल धनी शहर ही जल की धारणीय आपूर्ति को सुनिश्चित कर सकते हैं।
2. शहरों में जल की धारणीय आपूर्ति का अर्थ कुटुम्बों को जल की आपूर्ति करने से कहीं अधिक है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q25' OR (year = 2020 AND question_number = 25));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In India, agriculture still engages about half of its workforce, and about 85 per cent of its farms are small and marginal. Compared to China and Vietnam, which have experienced fast structural and rural transformation, India''s story is of slow transformation. As a result, poverty reduction in India was at a much slower pace during 1988-2014, compared to China and Vietnam. India''s poverty reduction was slow during 1988-2005, but during 2005-2012, it accelerated dramatically-almost three times faster than during the earlier period. What did India do during this period? Research reveals that the relative price scenario changed significantly (by more than 50%) in favour of agriculture in the wake of rising global prices. This boosted private investments in agriculture by more than 50%. As a result, agri-GDP growth touched 4.1% during 2007-2012 as against 2.4% during 2002-2007. The net surplus of agri-trade touched $25 billion in 2013-2014; real farm wages rose by 7% per annum. All this led to unprecedented fall in poverty.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में, अभी भी लगभग पचास प्रतिशत कामगार कृषि में विनियोजित हैं, तथा लगभग 85 प्रतिशत खेत छोटे और सीमांत हैं। चीन और वियतनाम की तुलना में, जहाँ तेज़ गति से संरचनात्मक और ग्रामीण परिवर्तन हुए, भारत की कहानी धीमे परिवर्तन की है। परिणामस्वरूप भारत में गरीबी-ह्रास, चीन और वियतनाम की तुलना में, 1988-2014 के बीच बहुत धीमी गति का था। भारत का गरीबी-ह्रास 1988-2005 के बीच धीमा था, परंतु 2005-2012 के दौरान यह नाटकीय गति से बढ़ा-पूर्व के काल की तुलना में तीन गुना तेज़ गति से। इस काल में भारत ने क्या किया ? शोध से पता चलता है कि सापेक्ष कीमतों का दृश्यलेख, बढ़ती वैश्विक कीमतों के परिणामस्वरूप, कृषि के पक्ष में महत्त्वपूर्ण ढंग से परिवर्तित हुआ है (50% से भी अधिक)। इससे कृषि में निजी निवेश 50% से भी अधिक बढ़ा। परिणामस्वरूप, कृषि-जी० डी० पी० की वृद्धि ने 2002-2007 के 2.4% के मुकाबले 2007-2012 में 4.1% के स्तर को छुआ। कृषि-व्यापार के निवल अधिशेष ने 2013-2014 में $25 बिलियन के स्तर को छुआ; वास्तविक कृषि मज़दूरी 7% प्रति वर्ष की दर से बढ़ी। इन सबके कारण गरीबी में अभूतपूर्व गिरावट आई।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Structural and rural transformation is impossible when farms are mainly small and marginal.
2. A good price incentive can trigger investments in agriculture.
3. India needs to build value chains for high-value agri-products like livestock and horticulture.
4. Higher global prices of agricultural commodities are essential for India''s poverty reduction.
Which of the above assumptions are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जब कृषि जोत मूलतः छोटे और सीमांत हों तब संरचनात्मक और ग्रामीण परिवर्तन असंभव है।
2. अच्छी कीमत प्रोत्साहन कृषि में निवेश को प्रेरित कर सकती है।
3. भारत के लिए उच्च मूल्य के कृषि उत्पादों, जैसे कि पशुधन और बागवानी, के लिए मूल्य-श्रृंखलाओं (value chains) को बनाने की आवश्यकता है।
4. कृषि-माल की उच्च वैश्विक कीमतें भारत के गरीबी-ह्रास के लिए आवश्यक हैं।
उपर्युक्त में से कौन-सी पूर्वधारणाएँ वैध हैं?'
WHERE (id = 'csat-2020-q26' OR (year = 2020 AND question_number = 26));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In India, agriculture still engages about half of its workforce, and about 85 per cent of its farms are small and marginal. Compared to China and Vietnam, which have experienced fast structural and rural transformation, India''s story is of slow transformation. As a result, poverty reduction in India was at a much slower pace during 1988-2014, compared to China and Vietnam. India''s poverty reduction was slow during 1988-2005, but during 2005-2012, it accelerated dramatically-almost three times faster than during the earlier period. What did India do during this period? Research reveals that the relative price scenario changed significantly (by more than 50%) in favour of agriculture in the wake of rising global prices. This boosted private investments in agriculture by more than 50%. As a result, agri-GDP growth touched 4.1% during 2007-2012 as against 2.4% during 2002-2007. The net surplus of agri-trade touched $25 billion in 2013-2014; real farm wages rose by 7% per annum. All this led to unprecedented fall in poverty.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में, अभी भी लगभग पचास प्रतिशत कामगार कृषि में विनियोजित हैं, तथा लगभग 85 प्रतिशत खेत छोटे और सीमांत हैं। चीन और वियतनाम की तुलना में, जहाँ तेज़ गति से संरचनात्मक और ग्रामीण परिवर्तन हुए, भारत की कहानी धीमे परिवर्तन की है। परिणामस्वरूप भारत में गरीबी-ह्रास, चीन और वियतनाम की तुलना में, 1988-2014 के बीच बहुत धीमी गति का था। भारत का गरीबी-ह्रास 1988-2005 के बीच धीमा था, परंतु 2005-2012 के दौरान यह नाटकीय गति से बढ़ा-पूर्व के काल की तुलना में तीन गुना तेज़ गति से। इस काल में भारत ने क्या किया ? शोध से पता चलता है कि सापेक्ष कीमतों का दृश्यलेख, बढ़ती वैश्विक कीमतों के परिणामस्वरूप, कृषि के पक्ष में महत्त्वपूर्ण ढंग से परिवर्तित हुआ है (50% से भी अधिक)। इससे कृषि में निजी निवेश 50% से भी अधिक बढ़ा। परिणामस्वरूप, कृषि-जी० डी० पी० की वृद्धि ने 2002-2007 के 2.4% के मुकाबले 2007-2012 में 4.1% के स्तर को छुआ। कृषि-व्यापार के निवल अधिशेष ने 2013-2014 में $25 बिलियन के स्तर को छुआ; वास्तविक कृषि मज़दूरी 7% प्रति वर्ष की दर से बढ़ी। इन सबके कारण गरीबी में अभूतपूर्व गिरावट आई।',
    question_english = 'Which one of the following statements best reflects the critical message of the passage?',
    question_hindi = 'निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?'
WHERE (id = 'csat-2020-q27' OR (year = 2020 AND question_number = 27));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Spanish ships in the late 16th century first brought the potato tuber from South America to Europe whereby in the early 19th century, it had become a reliable backup to cereal crops, particularly in the cold, rain-soaked soils of Ireland. The Irish were soon almost wholly dependent on the potato as their staple food. And they were planting primarily one prodigious variety, the ''Lumper'' potato, whose genetic frailty would be cruelly exposed by the fungus ''Phytophthora infestans''. In 1845, spores of the deadly fungus began spreading across the country, destroying nearly all the Lumpers in its path. The resulting famine killed or displaced millions.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
स्पैनिश जहाज 16वीं शताब्दी के उत्तरार्ध में पहली बार दक्षिण अमेरिका से आलू कंद यूरोप लाए, जिससे कि प्रारंभिक 19वीं शताब्दी में यह विशेषकर ठंडे आयरलैंड की वर्षा से तर भूमि में धान्य फसलों का विश्वसनीय पूर्तिकर हो गया। आयरलैंड-वासी शीघ्र ही लगभग पूर्णतः प्रधान खाद्य के रूप में आलू पर निर्भर हो गए। और वे मुख्य रूप से उसकी एक बृहदाकार किस्म, ''लम्पर'' आलू को उगाने लगे, जिसकी आनुवंशिक भंगुरता को एक कवक ''फाइटोफ्थोरा इन्फेस्टेन्स (Phytophthora infestans)'' ने आने वाले समय में निर्ममता से अनावृत कर दिया। 1845 में इस घातक कवक के बीजाणुओं ने समूचे देश में फैलना आरम्भ कर दिया और अपने पथ में आने वाले लगभग सभी लम्परों को नष्ट कर दिया। इसके परिणामस्वरूप हुए अकाल ने कई मिलियन लोगों को मार दिया या विस्थापित किया।',
    question_english = 'Which one of the following statements best reflects the critical message of the passage?',
    question_hindi = 'निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?'
WHERE (id = 'csat-2020-q41' OR (year = 2020 AND question_number = 41));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India is at once among the fastest growing global economies and home to the largest number of malnourished children in the world. There are regions where malnutrition is not the exception but the norm. And across the country, malnutrition is the cause of death for roughly half the 1.3 million children who die before their fifth birthday each year. Even those children who survive suffer permanently from the damage that has already been done to their bodies and minds from not getting enough of the right foods and nutrients. Around 44 million children under 5 are stunted. That makes it harder for them to learn in school and subsequently earn a living as adults. Their lifetime earnings potential is almost a quarter less than that of their healthy peers.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत सबसे तीव्र विकसित होने वाली वैश्विक अर्थव्यवस्थाओं में से है, फिर भी यह विश्व में सबसे अधिक कुपोषित बच्चों का घर है। ऐसे भी क्षेत्र हैं जहाँ कुपोषण अपवाद नहीं अपितु सामान्य है। और सारे देश में, हर वर्ष अपना पाँचवाँ जन्मदिन मनाने से पूर्व मरने वाले 1-3 मिलियन बच्चों में से लगभग आधे बच्चों की मृत्यु का कारण कुपोषण है। वे बच्चे जो जीवित रह जाते हैं, स्थायी रूप से उस क्षति से ग्रसित रहते हैं जो उनके शरीर और मन में उपयुक्त खाद्यों एवं पोषकों के पर्याप्त मात्रा में न मिलने से हो चुकी होती है। 5 वर्ष से कम आयु के लगभग 44 मिलियन बच्चे अविकसित हैं। इससे उनको विद्यालय में सीखने और वयस्क होने पर जीविका कमाने में कठिनाई होती है। उनकी जीवनकालीन उपार्जन क्षमता उनके स्वस्थ समकक्षों से लगभग एक चौथाई कम होती है।',
    question_english = 'With reference to the above passage, which of the following is/are the most rational and practical implication/implications?
1. India''s Public Distribution System should be monitored by the Union Government.
2. Girls should be encouraged to delay marriage and first pregnancy.
3. Mothers should be encouraged to breastfeed their children immediately after birth.
4. The supply of safe drinking water and proper sanitation facilities to all should be ensured.
5. Authorities should ensure the vaccination as prescribed.
Select the correct answer using the code given below.',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत एवं व्यावहारिक निहितार्थ है/हैं?
1. भारत की सार्वजनिक वितरण प्रणाली को केन्द्र सरकार द्वारा मॉनीटर किया जाना चाहिए।
2. बालिकाओं को विवाह एवं प्रथम गर्भ विलम्बित करने के लिए प्रोत्साहित करना चाहिए।
3. जन्म के तुरंत बाद नवजात को स्तनपान कराने हेतु माताओं को प्रोत्साहित करना चाहिए।
4. सभी के लिए सुरक्षित पेय जल एवं उपयुक्त स्वच्छता सुविधाओं की आपूर्ति सुनिश्चित करनी चाहिए।
5. प्राधिकारियों को यथानिर्धारित टीकाकरण सुनिश्चित करना चाहिए।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।'
WHERE (id = 'csat-2020-q42' OR (year = 2020 AND question_number = 42));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
The pulse variety ''Pusa Arhar 16'' has the potential to be grown in the paddy-growing regions of Punjab, Haryana and Uttar Pradesh and eventually in all of India. Its yield (about 2000 kg/hectare) will be significantly greater than those of the existing varieties and because its size will be uniform, it will be amenable to mechanical harvesting, an attractive feature for farmers in northern India who currently use this technology for paddy. Most important, Arhar straw, unlike paddy straw, is green and can be ploughed back into the soil. In paddy straw, the problem is the high silica content, which does not allow for easy decomposition. In the case of Arhar, the farmer, even after combine harvesting, just needs to run a rotovator to cut the leftover straw into pieces, which can be ploughed back and will decompose very fast. All this is difficult with leftover paddy stalks that cannot be easily salvaged or ploughed back. Farmers, therefore, choose the easiest option of simply burning it.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
दलहन की प्रजाति ''पूसा अरहर 16'' को पंजाब, हरियाणा और उत्तर प्रदेश के धान उगाने वाले क्षेत्रों और अंततः सम्पूर्ण भारत में उगाए जा सकने की संभावना है। उसकी उत्पादकता (लगभग 2000 कि० ग्रा०/हेक्टेयर) उपलब्ध प्रजातियों की तुलना में महत्त्वपूर्ण रूप से अधिक होगी और चूँकि उसके आकार में एकरूपता होगी, उसकी कटाई मशीनों से भी संभव होगी एवं उत्तरी भारत के उन कृषकों, जो आजकल इस तकनीक का प्रयोग धान के लिए करते हैं, के लिए एक आकर्षक विशेषता होगी। सबसे महत्त्वपूर्ण यह है कि अरहर का पुआल, धान के पुआल के विपरीत, हरा होता है और उसे मृदा में वापस जोता जा सकता है। धान के पुआल में परेशानी यह है कि सेलखड़ी (silica) की मात्रा अधिक होती है जो आसानी से उसका अपघटन नहीं होने देती। अरहर में कंबाइन कटाई के बाद भी कृषक को बचे हुए पुआल को छोटे टुकड़ों में काटने के लिए केवल रोटोवेटर चलाने की आवश्यकता होती है जिन्हें वापस जोता जा सकता है और जो बहुत तेजी से अपघटित हो जाते हैं। यह कार्य धान के बचे हुए डंठलों के साथ कठिन है जिन्हें आसानी से निकाला या वापस नहीं जोता जा सकता। इसलिए, कृषक साधारणतः इसे जलाने का आसान रास्ता चुनते हैं।',
    question_english = 'Which of the following are the most rational inferences that can be made from the passage?
1. Farmers'' income will be higher with pulse cultivation than with paddy cultivation.
2. Pulse cultivation causes less pollution as compared to paddy cultivation.
3. Pulse straw can be used to improve soil quality.
4. In the context of northern Indian agriculture, paddy straw has no usefulness.
5. Mechanized agriculture is the main cause for stubble burning.
Select the correct answer using the code given below.',
    question_hindi = 'निम्नलिखित में से कौन-से ऐसे सर्वाधिक तर्कसंगत निष्कर्ष हैं जो उपर्युक्त परिच्छेद से निकाले जा सकते हैं?
1. धान की तुलना में दलहन उगाने से कृषकों की आय अधिक होगी।
2. दलहन उगाना, धान उगाने की तुलना में कम प्रदूषण उत्पन्न करता है।
3. दलहन के पुआल का प्रयोग मृदा की गुणवत्ता में सुधार लाने के लिए किया जा सकता है।
4. उत्तरी भारत की कृषि के संदर्भ में, धान के पुआल की कोई उपयोगिता नहीं है।
5. मशीनीकृत खेती ठूंठ जलाने का प्रमुख कारक है।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।'
WHERE (id = 'csat-2020-q43' OR (year = 2020 AND question_number = 43));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
In India, authorities always look to store the maximum amount of water in reservoirs during the monsoon season, which is then used for irrigation and generation of electricity during the summer months. It is an internationally accepted practice that the water level of a reservoir should be kept below a certain level before the onset of monsoon season. This is so that when monsoon rains come, there is space to store the excess rainwater and also so that water can be released in a regulated manner. But the authorities store the maximum amount of water in reservoirs even before the close of the monsoon, only to ensure greater electricity generation and irrigation.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
भारत में, प्राधिकारी मानसून ऋतु में जलाशयों में अधिकतम जल संचय करने की कोशिश करते हैं, जिसे गर्मी के महीनों में सिंचाई एवं विद्युत् उत्पादन के लिए प्रयोग में लाया जाता है। मानसून ऋतु आने के समय जलाशय में जल को एक निश्चित स्तर से नीचे बनाए रखना एक अंतर्राष्ट्रीय रूप में स्वीकार्य प्रथा है। ऐसा इसलिए है क्योंकि जब मानसून की वर्षा होती है तो अतिरेक वर्षा जल के संचयन के लिए जगह हो तथा जल को नियंत्रित रूप में छोड़ा भी जा सके। परंतु प्राधिकारी मानसून के समाप्त होने से पहले ही जलाशयों में अधिक-से-अधिक जल संचय कर लेते हैं, जिससे अधिक विद्युत् उत्पादन एवं सिंचाई सुनिश्चित की जा सके।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. High risks involved in holding maximum water in reservoirs are due to our over-dependence on hydropower projects.
2. Storage capacity of dams should not be fully used before or during monsoon season.
3. Role of dams in flood control is underestimated in India.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जलाशयों में अधिकतम जल संचयन में होने वाले भारी जोखिम, जलशक्ति परियोजनाओं पर हमारी अत्यधिक निर्भरता के कारण है।
2. बाँधों की संग्रहण क्षमता का मानसून ऋतु के पूर्व अथवा दौरान पूर्ण उपयोग नहीं किया जाना चाहिए।
3. भारत में बाढ़ नियंत्रण के लिए बाँधों की भूमिका को कम करके आँका गया है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q44' OR (year = 2020 AND question_number = 44));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Economic liberalization in India was shaped largely by the economic problems of the government than by the economic priorities of the people or by the long-term development objectives. Thus, there were limitations in conception and design which have been subsequently validated by experience. Jobless growth, persistent poverty and rising inequality have mounted as problems since economic liberalization began. And all these years later, four quiet crises confront the economy; agriculture, infrastructure, industrialization and education as constraints on the country''s future prospects. These problems must be resolved if economic growth has to be sustained and transformed into meaningful development.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में आर्थिक उदारीकरण का स्वरूप अधिकतर सरकार की आर्थिक समस्याओं से तय हुआ था न कि जनता की आर्थिक प्राथमिकताओं से अथवा दीर्घकालीन विकास के उद्देश्यों से। अतः, संकल्पना एवं रूपरेखा की सीमाएँ थीं जो बाद में अनुभव से पुष्ट हुईं। आर्थिक उदारीकरण के प्रारंभ से रोज़गार-विहीन वृद्धि, सतत गरीबी और बढ़ती असमानता समस्याओं के रूप में उभरी हैं। और इन सभी वर्षों के बाद में, चार मौन संकट अर्थव्यवस्था के सम्मुख खड़े हुए हैं; कृषि, अधोसंरचना, उद्योगीकरण एवं शिक्षा; जो देश के भावी परिदृश्य में बंधनकारक हैं। यदि आर्थिक वृद्धि को बनाए रखना है और उसे सार्थक विकास में रूपांतरित करना है, तो इन समस्याओं का निराकरण होना ही चाहिए।',
    question_english = 'Which of the following is/are the most rational and logical inference/inferences that can be made from the passage?
1. It is essential to rethink and redefine the economic role of the State in the quest for development.
2. India has not made effective implementation of its policies in social sectors nor made sufficient investments in them.
Select the correct answer using the code given below.',
    question_hindi = 'इस परिच्छेद से निम्नलिखित में से कौन-सा/से सर्वाधिक तर्कसंगत और तार्किक निष्कर्ष निकाला/निकाले जा सकता/सकते है/हैं?
1. विकास की तलाश में यह अनिवार्य है कि राज्य की आर्थिक भूमिका पर पुनर्विचार किया जाए एवं उसे पुनर्परिभाषित किया जाए।
2. भारत ने अपने सामाजिक क्षेत्रों में न तो नीतियों का प्रभावी निष्पादन किया और न ही उनमें पर्याप्त निवेश किया।
नीचे दिए गए कूट का प्रयोग कर सही उत्तर चुनिए।'
WHERE (id = 'csat-2020-q45' OR (year = 2020 AND question_number = 45));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
Economic liberalization in India was shaped largely by the economic problems of the government than by the economic priorities of the people or by the long-term development objectives. Thus, there were limitations in conception and design which have been subsequently validated by experience. Jobless growth, persistent poverty and rising inequality have mounted as problems since economic liberalization began. And all these years later, four quiet crises confront the economy; agriculture, infrastructure, industrialization and education as constraints on the country''s future prospects. These problems must be resolved if economic growth has to be sustained and transformed into meaningful development.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
भारत में आर्थिक उदारीकरण का स्वरूप अधिकतर सरकार की आर्थिक समस्याओं से तय हुआ था न कि जनता की आर्थिक प्राथमिकताओं से अथवा दीर्घकालीन विकास के उद्देश्यों से। अतः, संकल्पना एवं रूपरेखा की सीमाएँ थीं जो बाद में अनुभव से पुष्ट हुईं। आर्थिक उदारीकरण के प्रारंभ से रोज़गार-विहीन वृद्धि, सतत गरीबी और बढ़ती असमानता समस्याओं के रूप में उभरी हैं। और इन सभी वर्षों के बाद में, चार मौन संकट अर्थव्यवस्था के सम्मुख खड़े हुए हैं; कृषि, अधोसंरचना, उद्योगीकरण एवं शिक्षा; जो देश के भावी परिदृश्य में बंधनकारक हैं। यदि आर्थिक वृद्धि को बनाए रखना है और उसे सार्थक विकास में रूपांतरित करना है, तो इन समस्याओं का निराकरण होना ही चाहिए।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. India''s economy needs to be greatly integrated with global economy so as to create large number of jobs and to sustain its growth momentum.
2. Economic liberalization would cause large economic growth which would reduce poverty and create sufficient employment in the long run.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. भारत की अर्थव्यवस्था को वैश्विक अर्थव्यवस्था से अत्यधिक समेकित करने की आवश्यकता है ताकि रोज़गार का बड़ी संख्या में सृजन किया जा सके तथा इसके वृद्धि संवेग को बनाए रखा जा सके।
2. आर्थिक उदारीकरण से बृहत् आर्थिक वृद्धि होगी जिससे दीर्घकाल में गरीबी घटेगी और रोज़गार का पर्याप्त सृजन होगा।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q46' OR (year = 2020 AND question_number = 46));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-1
Bank credit to the industrial sector has started shrinking. Its decline has been a serious concern as credit growth is essential to revive investment. The problem''s origins lie in the incomplete reforms of the last 25 years. An institutional change that should have followed the 1991 reforms should have been setting up of a resolution corporation for banks. In a market economy with booms and busts, banks should be allowed to be set up and to fail. Today, we cannot shut down banks because there is no proper system to shut them down. Weak loss-making banks continue to need more capital.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-1
औद्योगिक सेक्टर को मिलने वाले बैंक ऋण में संकुचन प्रारंभ हो गया है। इसमें कमी गंभीर चिंता का विषय है क्योंकि ऋण का प्रसार निवेश को पुनर्जीवित करने के लिए आवश्यक है। समस्या के उद्गम पिछले 25 वर्षों के अपूर्ण सुधारों में निहित हैं। 1991 के सुधारों के उपरांत बैंकों के लिए समाधान निगम की स्थापना का एक संस्थागत परिवर्तन होना चाहिए था। तेजी और मंदी वाली एक बाजार अर्थव्यवस्था में बैंकों को स्थापित करने एवं उन्हें असफल होने की अनुमति होनी चाहिए। आज हम बैंकों को बंद नहीं कर सकते क्योंकि उन्हें बंद करने की कोई उचित व्यवस्था नहीं है। कमजोर, हानि में रहने वाले बैंकों को निरंतर अधिक पूँजी की आवश्यकता होती है।',
    question_english = 'Which one of the following is the most logical and rational inference that can be made from the above passage?',
    question_hindi = 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?'
WHERE (id = 'csat-2020-q61' OR (year = 2020 AND question_number = 61));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India has tremendous potential for solar energy. We all realize that we have to stop burning fossil fuels to meet our energy needs. But certain renewable resources are still going through their cost curves and learning curves to get the required amount of output. The Indian Government has strongly committed to its targets of reducing emissions by 33 per cent by 2030, and towards this it has initiated a strong push towards a gas-based economy and has also invested heavily in renewable energy. However, business houses are wary of investing too heavily in renewable energy at a time when the technology is not yet ready.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में सौर ऊर्जा की विशाल संभावना है। हम सभी यह अनुभव करते हैं कि हमें अपनी ऊर्जा प्राप्त करने के लिए फॉसिल इंधनों को जलाना रोकना होगा। परंतु कुछ नवीकरणीय संसाधन वांछित उत्पादन-स्तर को प्राप्त करने के लिए अभी भी अपने लागत वक्रों एवं प्रवीणता वक्रों से गुजर रहे हैं। भारत सरकार 2030 तक उत्सर्जन को 33 प्रतिशत कम करने के अपने लक्ष्य से दृढ़ रूप से प्रतिबद्ध है तथा उस दिशा में उसने गैस पर आधारित अर्थव्यवस्था को एक सशक्त प्रोत्साहन दिया है और नवीकरणीय ऊर्जा में भारी निवेश भी किया है। परंतु व्यापारी घराने, ऐसे समय में जब तकनीक अभी तक तैयार नहीं है, नवीकरणीय ऊर्जा में भारी निवेश करने में हिचकिचा रहे हैं।',
    question_english = 'Which one of the following is the most logical and rational inference that can be made from the above passage?',
    question_hindi = 'उपर्युक्त परिच्छेद से निम्नलिखित में से कौन-सा सर्वाधिक तार्किक और तर्कसंगत निष्कर्ष निकाला जा सकता है?'
WHERE (id = 'csat-2020-q62' OR (year = 2020 AND question_number = 62));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-2
India has tremendous potential for solar energy. We all realize that we have to stop burning fossil fuels to meet our energy needs. But certain renewable resources are still going through their cost curves and learning curves to get the required amount of output. The Indian Government has strongly committed to its targets of reducing emissions by 33 per cent by 2030, and towards this it has initiated a strong push towards a gas-based economy and has also invested heavily in renewable energy. However, business houses are wary of investing too heavily in renewable energy at a time when the technology is not yet ready.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-2
भारत में सौर ऊर्जा की विशाल संभावना है। हम सभी यह अनुभव करते हैं कि हमें अपनी ऊर्जा प्राप्त करने के लिए फॉसिल इंधनों को जलाना रोकना होगा। परंतु कुछ नवीकरणीय संसाधन वांछित उत्पादन-स्तर को प्राप्त करने के लिए अभी भी अपने लागत वक्रों एवं प्रवीणता वक्रों से गुजर रहे हैं। भारत सरकार 2030 तक उत्सर्जन को 33 प्रतिशत कम करने के अपने लक्ष्य से दृढ़ रूप से प्रतिबद्ध है तथा उस दिशा में उसने गैस पर आधारित अर्थव्यवस्था को एक सशक्त प्रोत्साहन दिया है और नवीकरणीय ऊर्जा में भारी निवेश भी किया है। परंतु व्यापारी घराने, ऐसे समय में जब तकनीक अभी तक तैयार नहीं है, नवीकरणीय ऊर्जा में भारी निवेश करने में हिचकिचा रहे हैं।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Governments often provide inefficient and costly subsidies for technologies that may not be ready in the near future.
2. India''s commitment of reducing emissions by 33% by 2030 shall be on the basis of gas-based economy.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. सरकार प्रायः ऐसी तकनीक पर अक्षम एवं महँगी आर्थिक सहायता देती है जो निकट भविष्य के लिए तैयार नहीं हो सकती।
2. 2030 तक उत्सर्जन में 33% कटौती की भारत की प्रतिबद्धता गैस-आधारित अर्थव्यवस्था पर निर्भर होगी।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q63' OR (year = 2020 AND question_number = 63));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-3
Genome editing is different from genome modification. Genome editing typically involves finding the part of a plant genome that could be changed to render it less vulnerable to disease, or resistant to certain herbicides, or to increase yields. Researchers use ''molecular scissors'' to dissect the genome and repair it, which is a process that occurs naturally when plants are under attack from diseases and can throw up new mutations that enable the plant to survive future attacks. This evolutionary process can effectively be speeded up now that it is possible to examine plant genomes in detail in laboratories, and create mechanisms through which the relevant genes can be altered very precisely.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-3
जीनोम संपादन, जीनोम रूपांतरण से भिन्न है। जीनोम संपादन विशेष रूप से पादप जीनोम के उस भाग का पता लगाने से संबंधित है जिसको परिवर्तित किया जा सके जिससे रोग की भेद्यता कम की जा सके या कुछ शाकनाशियों के विरुद्ध प्रतिरोधी बनाया जा सके या उत्पादकता बढ़ाई जा सके। शोधकर्ता जीनोम का विच्छेदन करने के लिए ''आण्विक कैंची'' का उपयोग करते हैं और इसकी मरम्मत करते हैं जो कि पादपों में होने वाली वह प्राकृतिक प्रक्रिया है, जो पादप रोगों के आक्रमण के अधीन होने पर नए उत्परिवर्तनों को उत्पन्न कर सकती है, जो कि उस पादप को भविष्य में होने वाले आक्रमणों से बचे रहने में सक्षम बनाता है। अब जबकि प्रयोगशालाओं में पादप जीनोम का विस्तार से परीक्षण करना संभव है और संगत जीनों को सुस्पष्ट रूप में परिवर्तित करने की क्रियाविधि का सृजन किया जा सकता है, इस विकास प्रक्रिया में प्रभावी रूप से तेजी लाई जा सकती है।',
    question_english = 'With reference to the above passage, the following assumptions have been made:
1. Genome editing does not require the transfer of genes from one plant to another.
2. Through genome editing, the chosen genes can be altered precisely in a manner akin to the natural process that helps plants to adapt to the environmental factors.
Which of the above assumptions is/are valid?',
    question_hindi = 'उपर्युक्त परिच्छेद के संदर्भ में, निम्नलिखित पूर्वधारणाएँ बनाई गई हैं :
1. जीनोम संपादन में एक पादप से दूसरे पर जीनों के स्थानांतरण की आवश्यकता नहीं है।
2. जीनोम संपादन के द्वारा चुनी हुई जीनों को सही रूप में एक प्राकृतिक प्रक्रिया के रूप में परिवर्तित किया जा सकता है जिससे पौधों को पर्यावरण तत्त्वों के साथ अनुकूलित होने में सहायता मिलती है।
उपर्युक्त में से कौन-सी पूर्वधारणा/पूर्वधारणाएँ वैध है/हैं?'
WHERE (id = 'csat-2020-q64' OR (year = 2020 AND question_number = 64));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-4
Many people understand the connection between solid waste management and health in terms of the consequences of unattended heaps of dry garbage which become home for flies and other vermin. However, there is another aspect that is not well-understood, that is, what happens when unscientific solid waste management combines with poor drainage and dumping of untreated sewage into drains which are meant to carry storm water during rains. The result is choked drains which are full of stagnant water breeding mosquitoes, resulting in the spread of water-borne diseases.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-4
बहुत-से लोग ठोस अपशिष्ट प्रबंधन एवं स्वास्थ्य का संबंध ठोस कचरे के उपेक्षित ढेर के परिणाम के रूप में समझते हैं जो मक्खियों और कीड़े-मकोड़ों का घर बनते हैं। किन्तु एक दूसरा पक्ष भी है जिसे सही रूप में समझा नहीं जाता, कि क्या परिणाम होता है जब अवैज्ञानिक ठोस अपशिष्ट प्रबंधन के साथ ही जल निकास व्यवस्था खराब होती है और असंसाधित मल-जल को बारिश के पानी को ले जाने वाले नालों में छोड़ दिया जाता है। उसका परिणाम होता है नालों का अवरुद्ध हो जाना जिनमें रुका हुआ पानी भरा रहता है, मच्छर पैदा होते हैं तथा जल-जनित रोग फैलते हैं।',
    question_english = 'In the context of India, which one of the following statements best reflects the critical message of the passage?',
    question_hindi = 'भारत के संदर्भ में, निम्नलिखित में से कौन-सा कथन परिच्छेद के क्रांतिक संदेश का सर्वोत्तम प्रेषण करता है?'
WHERE (id = 'csat-2020-q65' OR (year = 2020 AND question_number = 65));

UPDATE public.csat_pyq
SET
    passage_english = 'Directions for the following item:
Read the following passage and answer the item that follows. Your answer to this item should be based on the passage only.

Passage-5
In Part III of the Constitution, which assures people certain fundamental rights, Article 25 proclaims that "all persons are equally entitled to freedom of conscience and the right freely to profess, practise and propagate religion". What people fail to notice is that this proclamation is prefixed with the words "subject to public order, morality, health and to the other provisions of this Part", which set conditions precedent for the legal protection of religious practices of any community. The closing words of this prefatory rider in Article 25 virtually constitute a subordination clause placing other fundamental rights mentioned in Part III over and above the right to religious freedom. Among those other fundamental rights is the right to equality before law and equal protection of laws—assured at the outset and elaborated in later articles to mean, inter alia, that the State shall not deny equal protection of laws to any person or group of persons on the basis of religion alone.',
    passage_hindi = 'निम्नलिखित प्रश्नांश के लिए निर्देश :
नीचे दिए गए परिच्छेद को पढ़िए और परिच्छेद के नीचे आने वाले प्रश्नांश का उत्तर दीजिए। इस प्रश्नांश का आपका उत्तर केवल इस परिच्छेद पर ही आधारित होना चाहिए।

परिच्छेद-5
संविधान के भाग III में, जो जनसाधारण को कुछ मौलिक अधिकारों के प्रति आश्वस्त करता है, अनुच्छेद 25 उद्घोषणा करता है कि "सभी व्यक्तियों को अंतःकरण की स्वतंत्रता का और धर्म के अबाध रूप से मानने, आचरण करने और प्रचार करने का समान हक़ होगा", लेकिन जिस बात पर लोग प्रायः ध्यान नहीं देते हैं वह है इस उद्घोषणा का इन शब्दों वाला उपसर्ग, "लोक व्यवस्था, सदाचार, स्वास्थ्य तथा इस भाग के अन्य उपबंधों के अधीन रहते हुए"। यह उपसर्ग किसी समुदाय के धार्मिक आचरण के वैधानिक संरक्षण की पूर्व शर्तें निर्धारित करता है। अनुच्छेद 25 की इस प्रारंभिक शर्त के अंतिम शब्द वस्तुतः एक अधीनस्थ खण्ड की संरचना करते हैं जिसके अनुसार भाग III में वर्णित अन्य मौलिक अधिकारों को धार्मिक स्वतंत्रता के अधिकार के ऊपर प्रधानता मिलती है। उन अन्य मौलिक अधिकारों में विधि के समक्ष समता का अधिकार और स्वयं विधियों के भी समान संरक्षण का अधिकार है- जिनका प्रारंभ में ही आश्वासन है तथा बाद के अनुच्छेदों में इस अर्थ के साथ विस्तार है कि, अन्य बातों के साथ, राज्य किसी भी व्यक्ति या व्यक्तियों के समूह को केवल धर्म के आधार पर विधियों के समान संरक्षण से वंचित नहीं करेगा।',
    question_english = 'What is the most logical inference from the above passage?',
    question_hindi = 'उपर्युक्त परिच्छेद का सर्वाधिक तार्किक निष्कर्ष क्या है?'
WHERE (id = 'csat-2020-q66' OR (year = 2020 AND question_number = 66));

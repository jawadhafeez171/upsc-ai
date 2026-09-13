# -*- coding: utf-8 -*-
"""
Enrich Physical Geography & Earth Systems Knowledge Graph
---------------------------------------------------------
Implements full Level-4 granularity across:
1. Physical Geography & Earth Systems (Geomorphology)
   - Begins with 'Earth and The Solar System'
   - Earth's Internal Structure & Discontinuities
   - Rocks: Formation and Classification (Igneous, Sedimentary, Metamorphic, Rock Cycle)
   - Continental Drift & Plate Tectonics
   - Separate Topics for: Earthquakes, Volcanoes, Tsunamis
   - Geomorphic Processes & Landform Evolution (Fluvial, Glacial, Aeolian, Karst, Coastal)
2. Climatology (renamed from Climatology & Atmospheric Dynamics)
   - Atmosphere Structure & Heat Budget
   - Atmospheric Pressure & Global Wind Belts
   - Atmospheric Moisture, Condensation & Precipitation
   - Air Masses, Fronts & Cyclogenesis
   - World Climate Regions (Koppen's Classification)
   - Hydrological Cycle & Global Water Balance
   - Groundwater Hydrology & Aquifers
3. Oceanography & Marine Systems
   - Ocean Floor Relief & Topography
   - Ocean Temperature, Salinity & Density Profiles
   - Ocean Movements: Waves, Tides & Currents (comprehensive coverage)
   - Marine Ecosystems, Coral Reefs, Resources & UNCLOS
"""

import json
import os
import re

SUBJECT_ID = "geography_earth_systems"
SUBJECT_NAME = "Geography & Earth Systems"

def generate_keywords(name, description, entities):
    text = f"{name} {description} {' '.join(entities)}"
    words = re.findall(r'[a-zA-Z0-9\~%]+', text)
    seen = set()
    keywords = []
    stopwords = {"and", "or", "the", "a", "an", "in", "on", "of", "to", "for", "with", "by", "from", "at", "is", "are", "vs", "etc", "as", "its"}
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

    # 1. Update Domain Name for Climatology
    clim_domain_id = f"{SUBJECT_ID}.climatology_atmospheric_dynamics"
    if clim_domain_id in nodes:
        nodes[clim_domain_id]["name"] = "Climatology"

    # 2. Clean up old combined topic 'earthquakes_tsunamis_volcanism' if present
    old_eq_volc_id = f"{SUBJECT_ID}.physical_geography_earth_systems.earthquakes_tsunamis_volcanism"
    if old_eq_volc_id in nodes:
        del nodes[old_eq_volc_id]
        parent_node = nodes.get(f"{SUBJECT_ID}.physical_geography_earth_systems")
        if parent_node and old_eq_volc_id in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].remove(old_eq_volc_id)

    # 3. Define New / Updated Topics
    topics_to_add = [
        # Domain 1: physical_geography_earth_systems
        {
            "id": f"{SUBJECT_ID}.physical_geography_earth_systems.earth_and_the_solar_system",
            "slug": "earth_and_the_solar_system",
            "name": "Earth and The Solar System",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.physical_geography_earth_systems.rocks_formation_and_classification",
            "slug": "rocks_formation_and_classification",
            "name": "Rocks: Formation and Classification",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.physical_geography_earth_systems.earthquakes",
            "slug": "earthquakes",
            "name": "Earthquakes: Mechanics, Seismic Waves & Hazard Zones",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.physical_geography_earth_systems.volcanoes",
            "slug": "volcanoes",
            "name": "Volcanoes: Volcanism, Intrusive & Extrusive Landforms",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.physical_geography_earth_systems.tsunamis",
            "slug": "tsunamis",
            "name": "Tsunamis: Generation, Shoaling & Early Warning Systems",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        # Domain 2: climatology_atmospheric_dynamics
        {
            "id": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation",
            "slug": "atmospheric_moisture_condensation_precipitation",
            "name": "Atmospheric Moisture, Condensation & Precipitation",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.hydrological_cycle_and_water_balance",
            "slug": "hydrological_cycle_and_water_balance",
            "name": "Hydrological Cycle & Global Water Balance",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "id": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.groundwater_hydrology_and_aquifers",
            "slug": "groundwater_hydrology_and_aquifers",
            "name": "Groundwater Hydrology, Aquifers & Springs",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics",
            "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        }
    ]

    for t in topics_to_add:
        tid = t["id"]
        pid = t["parentId"]
        parent_node = nodes.get(pid)
        if not parent_node:
            print(f"Error: Parent {pid} not found!")
            continue

        if tid not in nodes:
            t_node = {
                "id": tid,
                "slug": t["slug"],
                "name": t["name"],
                "level": 3,
                "levelName": "Topic",
                "subject": SUBJECT_NAME,
                "subjectId": SUBJECT_ID,
                "parentId": pid,
                "childrenIds": [],
                "ancestorIds": [SUBJECT_ID, pid],
                "examTags": t["examTags"],
                "rawExamTagString": t["rawExamTagString"],
                "entities": [],
                "keywords": generate_keywords(t["name"], "", [])
            }
            nodes[tid] = t_node

        if tid not in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].append(tid)

    # Reorder topics in physical_geography_earth_systems to ensure 'earth_and_the_solar_system' is first
    geomorph_node = nodes.get(f"{SUBJECT_ID}.physical_geography_earth_systems")
    if geomorph_node:
        c_list = list(geomorph_node.get("childrenIds", []))
        first_topic = f"{SUBJECT_ID}.physical_geography_earth_systems.earth_and_the_solar_system"
        if first_topic in c_list:
            c_list.remove(first_topic)
            c_list.insert(0, first_topic)
            geomorph_node["childrenIds"] = c_list

    # 4. Define All Granular Level-4 Subtopics
    subtopics = [
        # -------------------------------------------------------------
        # 1. Earth and The Solar System
        # -------------------------------------------------------------
        {
            "slug": "origin_of_earth_universe_solar_system",
            "name": "Origin of the Universe, Solar System & Nebular Hypothesis",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earth_and_the_solar_system",
            "description": "Cosmological origins: Big Bang Theory (expanding universe, cosmic microwave background radiation), Nebular Hypothesis of Immanuel Kant and Pierre-Simon Laplace, Planetesimal Hypothesis; Accretion of protoplanets, Terrestrial (inner rocky) vs Jovian (outer gas giant) planets, asteroid belt, Kuiper belt, and Oort cloud.",
            "entities": ["Big Bang Theory", "Nebular Hypothesis (Kant & Laplace)", "Terrestrial vs Jovian Planets", "Planetesimal Accretion", "Asteroid Belt (Mars & Jupiter)", "Kuiper Belt & Oort Cloud"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "earths_shape_dimensions_geoid",
            "name": "Earth's Shape (Geoid), Coordinate System & Motions",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earth_and_the_solar_system",
            "description": "Oblate spheroid and Geoid shape (equatorial bulge due to centrifugal rotation); Earth's orbital motions: Rotation on 23.5 deg tilted axis (day-night cycle, Coriolis effect), Revolution around Sun along elliptical orbit; Perihelion (Jan 3) and Aphelion (July 4); Solstices (Summer June 21, Winter Dec 22) and Equinoxes (Vernal March 21, Autumnal Sept 23); Parallels of Latitude, Meridians of Longitude, International Date Line (IDL at 180 deg with zigzags), and Indian Standard Time (IST at 82.5 deg E).",
            "entities": ["Geoid Shape & Equatorial Bulge", "Orbital Revolution & Axis Tilt (23.5 deg)", "Solstices and Equinoxes", "Perihelion & Aphelion", "Latitudes & Longitudes", "International Date Line (180 deg)", "Indian Standard Time (82.5 deg E)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 2. Earth's Origin & Internal Structure
        # -------------------------------------------------------------
        {
            "slug": "earths_internal_layers_crust_mantle_core",
            "name": "Earth's Internal Layers: Crust, Mantle & Core",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earths_origin_internal_structure",
            "description": "Compositional and mechanical stratification: Crust (continental granitic SIAL vs oceanic basaltic SIMA), Mantle (Lithosphere rigid top, semi-molten ductile Asthenosphere source of magma and plate tectonics, lower Mesosphere), and Core / Barysphere (liquid outer core generating geomagnetic geodynamo field, solid crystalline inner core of NIFE iron-nickel at extreme pressure).",
            "entities": ["Continental Crust (SIAL)", "Oceanic Crust (SIMA)", "Asthenosphere (Partial Melt Zone)", "Lower Mantle (Mesosphere)", "Liquid Outer Core (Geodynamo)", "Solid Inner Core (NIFE)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "seismic_discontinuities_wave_shadow_zones",
            "name": "Seismic Discontinuities & Wave Shadow Zones",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earths_origin_internal_structure",
            "description": "Internal density boundaries: Conrad (upper-lower crust), Mohorovicic / Moho (crust-mantle), Repetti (upper-lower mantle), Gutenberg (mantle-outer core), and Lehmann discontinuity (outer-inner core); Seismic wave propagation: Primary (P) longitudinal compressional waves traveling through solids and liquids vs Secondary (S) transverse shear waves penetrating only solids; P-wave shadow zone (105 deg to 142 deg) and total S-wave shadow zone beyond 105 deg proving liquid outer core.",
            "entities": ["Mohorovicic Discontinuity (Moho)", "Gutenberg Discontinuity", "Lehmann Discontinuity", "P-wave Shadow Zone (105-142 deg)", "S-wave Complete Shadow Zone (>105 deg)", "Seismic Velocity Profile"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "geological_time_scale_and_stratigraphy",
            "name": "Geological Time Scale & Stratigraphic Eras",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earths_origin_internal_structure",
            "description": "Chronostratigraphic classification of Earth's 4.54 billion year history: Eons (Hadean, Archean, Proterozoic, Phanerozoic), Eras (Paleozoic ancient life, Mesozoic age of reptiles/dinosaurs, Cenozoic age of mammals), Periods (Cambrian, Carboniferous coal formations, Jurassic, Cretaceous Deccan volcanism, Quaternary), and Epochs (Pleistocene ice ages, Holocene recent, Anthropocene proposed).",
            "entities": ["Geological Time Scale", "Precambrian Eon", "Paleozoic Era (Carboniferous Coal)", "Mesozoic Era (Cretaceous Deccan Traps)", "Cenozoic Era (Himalayan Orogeny)", "Pleistocene Ice Ages & Holocene Epoch"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 3. Rocks: Formation and Classification
        # -------------------------------------------------------------
        {
            "slug": "mineral_groups_and_physical_properties",
            "name": "Major Mineral Groups & Physical Properties",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.rocks_formation_and_classification",
            "description": "Earth crust mineralogy: Major rock-forming mineral groups: Silicates (Feldspar most abundant 50%, Quartz 12%, Pyroxenes, Amphiboles, Mica, Olivine), Carbonates (Calcite, Dolomite), Oxides (Hematite, Magnetite); Physical testing criteria: Mohs Scale of Mineral Hardness (1-Talc, 2-Gypsum, 3-Calcite, 4-Fluorite, 5-Apatite, 6-Orthoclase Feldspar, 7-Quartz, 8-Topaz, 9-Corundum, 10-Diamond), cleavage, fracture, luster, and streak.",
            "entities": ["Silicate Mineral Group", "Feldspar & Quartz", "Mohs Scale of Mineral Hardness", "Cleavage and Fracture", "Streak and Luster Properties"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "igneous_sedimentary_metamorphic_rocks_cycle",
            "name": "Igneous, Sedimentary, Metamorphic Rocks & The Rock Cycle",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.rocks_formation_and_classification",
            "description": "Classification of rocks: Igneous primary rocks (Plutonic intrusive: Granite, Diorite, Gabbro with coarse crystals; Volcanic extrusive: Basalt, Obsidian, Pumice with fine crystals; Acidic high-silica vs Basic low-silica); Sedimentary stratified rocks (Mechanically formed/clastic: Sandstone, Shale, Conglomerate; Organically formed: Coal, Limestone; Chemically formed: Halite/Rock salt, Gypsum); Metamorphic rocks (Thermal contact vs Dynamic regional metamorphism; Foliated: Slate, Schist, Gneiss; Non-foliated: Marble from limestone, Quartzite from sandstone); Dynamic Rock Cycle driving continual transformation.",
            "entities": ["Igneous Rocks (Granite & Basalt)", "Sedimentary Rocks (Stratification & Fossils)", "Clastic vs Chemical Sedimentary", "Metamorphic Rocks (Foliation & Gneiss)", "Marble and Quartzite Metamorphism", "The Dynamic Rock Cycle"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 4. Continental Drift & Plate Tectonics
        # -------------------------------------------------------------
        {
            "slug": "continental_drift_theory_and_paleomagnetism",
            "name": "Continental Drift Theory & Paleomagnetic Evidence",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.continental_drift_plate_tectonics",
            "description": "Alfred Wegener's Continental Drift Theory (1912): Supercontinent Pangaea surrounded by Panthalassa; Evidence: Jig-saw fit of South American and African Atlantic coastlines, matching ancient orogenic rock belts, fossil distribution of freshwater reptile Mesosaurus and seed fern Glossopteris, and Permo-Carboniferous glacial tillite beds across Gondwana fragments; Paleomagnetism and polar wandering curves confirming continental mobility.",
            "entities": ["Wegener's Continental Drift Theory", "Supercontinent Pangaea & Panthalassa", "Jig-saw Coastline Matching", "Glossopteris & Mesosaurus Fossil Evidence", "Carboniferous Glacial Tillite", "Paleomagnetism & Polar Wandering"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "seafloor_spreading_and_magnetic_striping",
            "name": "Seafloor Spreading & Geomagnetic Reversals",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.continental_drift_plate_tectonics",
            "description": "Harry Hess's Seafloor Spreading hypothesis (1960): Upwelling convection currents in mantle creating new basaltic oceanic crust at Mid-Ocean Ridges (MOR); Vine-Matthews-Morley hypothesis of symmetric magnetic anomalies / paleomagnetic striping parallel to ridge crests recording Earth's magnetic field polarity reversals; Youthful age of oceanic crust (<200 million years) compared to ancient continental rocks.",
            "entities": ["Harry Hess Seafloor Spreading", "Mid-Ocean Ridge Upwelling", "Vine-Matthews-Morley Hypothesis", "Symmetric Magnetic Striping", "Geomagnetic Polarity Reversals", "Oceanic Crust Subduction"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "plate_tectonics_boundary_types_and_ring_of_fire",
            "name": "Plate Boundaries (Convergent, Divergent, Transform) & Ring of Fire",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.continental_drift_plate_tectonics",
            "description": "Seven major and minor tectonic plates (Pacific, North American, Eurasian, African, Indo-Australian, South American, Antarctic, Nazca, Cocos, Arabian); Plate boundaries: Divergent constructive (Mid-Atlantic Ridge, East African Great Rift Valley), Convergent destructive (Oceanic-Continental forming Andes, Oceanic-Oceanic forming Mariana trench and island arcs, Continental-Continental collision forming Himalayas), and Transform conservative faults (San Andreas Fault California); Pacific Ring of Fire harboring 75% of active volcanoes and 90% of global earthquakes.",
            "entities": ["Major and Minor Tectonic Plates", "Divergent Boundaries (Rift Valleys)", "Convergent Boundaries (Subduction Zones)", "Himalayan Continental Collision", "Transform Faults (San Andreas)", "Pacific Ring of Fire Subduction"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 5. Earthquakes
        # -------------------------------------------------------------
        {
            "slug": "earthquake_mechanics_waves_and_seismic_zones",
            "name": "Earthquake Mechanics, Seismic Waves & India's Seismic Zones",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.earthquakes",
            "description": "Elastic Rebound Theory; Hypocenter (Focus) vs Epicenter; Seismic waves: Body waves (P compressional, S shear) and Surface waves (Rayleigh ground-roll, Love horizontal shearing causing maximum structural destruction); Measurement scales: Richter scale (logarithmic physical magnitude) vs Modified Mercalli scale (observed human/structural intensity); Seismic Hazard Zonation of India (Zone II low to Zone V very severe in Himalayas, Kutch, Northeast).",
            "entities": ["Elastic Rebound Theory", "Focus (Hypocenter) & Epicenter", "Body Waves (P and S Waves)", "Surface Waves (Rayleigh and Love)", "Richter vs Mercalli Intensity Scale", "India Seismic Zones (Zone II to V)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 6. Volcanoes
        # -------------------------------------------------------------
        {
            "slug": "volcanic_forms_intrusive_plutonic_and_extrusive",
            "name": "Volcanism: Intrusive Plutonic & Extrusive Landforms",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.volcanoes",
            "description": "Magma vs lava; Intrusive plutonic structures: Batholiths (gigantic granitic core intrusions), Laccoliths (dome-shaped with level base), Lopoliths (saucer-shaped concavity), Phacoliths (anticline crest and syncline trough lens), Sills (horizontal concordant sheets), and Dikes (vertical discordant conduits); Extrusive volcanic morphology: Shield volcanoes (Hawaiian low-viscosity basaltic lava, gentle slopes, Mauna Loa), Composite/Stratovolcanoes (viscous explosive andesite with alternating pyroclastic ash layers, Mt. Fuji, Mt. St. Helens, Vesuvius), Calderas (catastrophic explosive collapses), Flood basalt provinces (Deccan Traps), and mid-ocean ridge fissure eruptions.",
            "entities": ["Plutonic Batholiths & Laccoliths", "Concordant Sills & Discordant Dikes", "Shield Volcanoes (Basaltic)", "Composite / Stratovolcanoes (Andesitic)", "Explosive Caldera Collapse", "Deccan Traps Flood Basalts"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 7. Tsunamis
        # -------------------------------------------------------------
        {
            "slug": "tsunami_generation_shoaling_and_early_warning",
            "name": "Tsunami Generation, Coastal Shoaling & Warning Systems",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.tsunamis",
            "description": "Physics of tsunamis: Submarine megathrust earthquake vertical seabed displacement, submarine volcanic caldera collapse or massive undersea landslides; Open ocean characteristics (extreme wavelength hundreds of kilometers, low amplitude <1m, jet-aircraft velocity ~800 km/h); Coastal Shoaling (compressing wave energy, sharp reduction in velocity, dramatic surge in wave height exceeding 10-30 meters); 2004 Indian Ocean tsunami (Sumatra 9.1 Mw earthquake) and 2011 Tohoku tsunami; Indian Ocean Tsunami Early Warning System (INCOIS, Hyderabad) utilizing Deep Ocean Assessment and Reporting of Tsunamis (DART) buoys and bottom pressure recorders.",
            "entities": ["Megathrust Displacement Mechanism", "Open-Ocean Wavelength & High Velocity", "Coastal Shoaling Effect (Wave Height Surge)", "2004 Indian Ocean Tsunami", "INCOIS Tsunami Warning System", "DART Buoy Sensor Network"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # 8. Geomorphic Processes & Landform Evolution
        # -------------------------------------------------------------
        {
            "slug": "weathering_processes_and_mass_wasting",
            "name": "Weathering (Physical, Chemical, Biological) & Mass Movements",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "In-situ disintegration and decomposition: Mechanical weathering (thermal stress shattering, frost wedging in periglacial areas, exfoliation onion-peeling domes, salt haloclasty); Chemical weathering (carbonation of limestone, hydration, oxidation of ferruginous rocks, hydrolysis of feldspars); Biological weathering (root wedging, lichen chelating acids, burrowing fauna); Mass Wasting driven by gravity: Slow movements (soil creep, solifluction), Rapid movements (earthflow, mudflow, debris avalanche), Landslides (rockfall, rotational slump); Slope stability factors and disaster risk reduction.",
            "entities": ["Mechanical Frost Wedging & Exfoliation", "Chemical Carbonation & Oxidation", "Biological Root Wedging", "Soil Creep & Solifluction", "Mudflow & Debris Avalanches", "Rotational Slump Landslides"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "fluvial_cycle_erosional_depositional_landforms",
            "name": "Fluvial Landforms: River Erosion, Transportation & Deposition",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "Fluvial cycle of erosion: Youth stage (downcutting, V-shaped valleys, gorges, Grand Canyon canyons, potholes, plunge pools, waterfalls); Mature stage (lateral planation, meandering courses, oxbow lakes, natural levees, broad floodplains); Old stage (braided river channels, peneplains, monadnocks, delta systems: arcuate Nile/Ganga, bird's-foot Mississippi, estuarine Narmada/Tapi).",
            "entities": ["V-shaped Valleys & Canyons", "Potholes & Plunge Pools", "Meanders & Oxbow Lakes", "Natural Levees & Floodplains", "Deltas (Arcuate, Bird's-foot, Estuarine)", "Peneplains & Monadnocks"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "glacial_erosional_and_depositional_landforms",
            "name": "Glacial Landforms: Alpine & Continental Glaciation",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "Glacial erosion by plucking and abrasion: Cirques (amphitheatre-shaped hollows / corries), Tarn lakes, Aretes knife-edge ridges, Pyramidal horns (Matterhorn), U-shaped glacial troughs, Hanging valleys with waterfalls, truncated spurs, Fiords drowned glacial valleys; Glacial deposition: Unsorted glacial till, Moraines (terminal, lateral, medial, ground), Drumlins (basket-of-eggs topography), Eskers sinuous gravel ridges, Kames, and outwash plains.",
            "entities": ["Cirques & Tarn Lakes", "Aretes & Pyramidal Horns", "U-shaped Glacial Valleys", "Hanging Valleys & Fiords", "Moraines (Terminal, Lateral, Medial)", "Drumlins & Sinuous Eskers"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "aeolian_arid_erosional_depositional_landforms",
            "name": "Aeolian Landforms: Desert Wind Erosion & Sand Dunes",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "Wind action in arid landscapes: Deflation and abrasion; Erosional: Deflation hollows / blowouts, Mushroom rocks (pedestal rocks), Yardangs wind-carved ridges, Zeugen tabular masses, Inselbergs (isolated residual hills); Depositional: Sand dunes classified by wind regimes (Barchans crescent-shaped pointing downwind, Seif longitudinal dunes, Transverse dunes, Star dunes), Loess vast unstratified wind-blown silt deposits (Huang He basin), Playas ephemeral salt lakes and Bajadas.",
            "entities": ["Mushroom / Pedestal Rocks", "Yardangs and Zeugen", "Barchans Crescent Dunes", "Seif Longitudinal Dunes", "Loess Silt Deposits (China)", "Playas & Bajadas"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "karst_topography_limestone_caves_speleothems",
            "name": "Karst Topography: Limestone Caves & Speleothems",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "Groundwater dissolution in calcium carbonate limestone and dolomite terrain: Surface erosional features: Sinkholes (swallow holes), Doline, Uvala, Polje massive depressions, Lapies furrowed surfaces, Blind valleys; Subterranean depositional features (Speleothems): Stalactites hanging from roof, Stalagmites growing upward from floor, cave pillars/columns formed by coalescence; Indian karst regions: Borra Caves (Visakhapatnam), Gupteswar (Odisha), Bastar.",
            "entities": ["Karst Dissolution Process", "Sinkholes, Doline & Polje", "Blind Valleys & Lapies", "Stalactites and Stalagmites", "Cave Columns & Pillars", "Borra Caves Limestone Karst"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "coastal_erosional_and_depositional_landforms",
            "name": "Coastal Landforms: Marine Wave Action & Shorelines",
            "parentId": f"{SUBJECT_ID}.physical_geography_earth_systems.geomorphic_processes_landform_evolution",
            "description": "Marine wave hydraulic action, abrasion, and attrition: Erosional features: Sea cliffs, Wave-cut notches, Wave-cut platforms, Sea caves, Sea arches, Sea stacks, Stumps; Depositional features: Sandy and shingle beaches, Spits, Offshore bars and barrier islands, Tombolos (sand bar connecting mainland to offshore island), Coastal lagoons (Chilika Lake, Pulicat, Vembanad); Coastlines of submergence (Ria, Fiord, Dalmatian) vs emergence.",
            "entities": ["Sea Cliffs & Wave-cut Platforms", "Sea Caves, Arches & Stacks", "Sandy Beaches & Spits", "Tombolos (Mainland-Island Connection)", "Barrier Islands & Coastal Lagoons", "Coastlines of Emergence & Submergence"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # Domain 2: Climatology
        # -------------------------------------------------------------
        # Topic: atmosphere_structure_heat_budget
        {
            "slug": "atmospheric_layers_composition_lapse_rates",
            "name": "Atmospheric Layers, Composition & Lapse Rates",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget",
            "description": "Atmospheric composition: Nitrogen 78%, Oxygen 21%, Argon 0.93%, Carbon dioxide 0.04%, water vapour and aerosols; Thermal layers: Troposphere (weather phenomena, thickness 8km at poles to 18km at equator, normal lapse rate 6.5 deg C/km), Stratosphere (Ozone layer absorbing UV rays, absence of vertical convection), Mesosphere (coldest layer -100 deg C, noctilucent clouds, meteor ablation), Thermosphere / Ionosphere (D, E, F layers reflecting HF radio waves, Aurora Borealis and Australis), Exosphere; Adiabatic lapse rates: Dry Adiabatic Lapse Rate (DALR 10 deg C/km) vs Wet/Saturated Adiabatic Lapse Rate (WALR 5-9 deg C/km).",
            "entities": ["Troposphere & Tropopause", "Stratosphere & Ozonosphere", "Mesosphere Noctilucent Clouds", "Ionosphere & Auroral Displays", "Normal Environmental Lapse Rate (6.5 deg C/km)", "Dry vs Wet Adiabatic Lapse Rate"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "solar_insolation_heat_budget_albedo",
            "name": "Insolation, Earth's Heat Budget & Albedo",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget",
            "description": "Solar radiation physics: Solar Constant (1.94 cal/cm2/min); Shortwave solar insolation vs Longwave terrestrial radiation; Earth's Heat Budget: Out of 100 incoming units, 35 units reflected back into space unabsorbed (Albedo of Earth: 27 from clouds, 2 from snow/ice, 6 from atmosphere); Remaining 65 units absorbed (14 by atmosphere, 51 by Earth's surface) and returned through radiation, conduction, and latent heat of condensation maintaining global thermal equilibrium.",
            "entities": ["Solar Constant", "Shortwave vs Longwave Radiation", "Earth's Albedo (35% Reflection)", "Global Heat Budget Equilibrium", "Greenhouse Radiative Balance"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "temperature_inversion_phenomena_and_types",
            "name": "Temperature Inversion: Radiation, Advection & Valley Belts",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget",
            "description": "Reversal of normal lapse rate where temperature increases with height; Favourable conditions: Long winter nights, clear cloudless skies, calm dry air; Inversion types: Surface / Ground radiation inversion, Advectional inversion (warm air blowing over cold surface), Valley inversion (cold dense air draining down slopes into valley bottoms while thermal belts form on mid-slopes, preventing frost damage to orchards); Inversion impacts: Trapping urban air pollution and smog, radiation fog formation.",
            "entities": ["Temperature Inversion Reversal", "Radiation Ground Inversion", "Advectional Marine Inversion", "Valley Air Drainage & Frost Pockets", "Thermal Belts on Slopes", "Smog Trapping Effects"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: atmospheric_pressure_global_wind_belts
        {
            "slug": "pressure_belts_tricellular_circulation_hadley",
            "name": "Global Pressure Belts & Tricellular Circulation (Hadley, Ferrel, Polar)",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts",
            "description": "Seven global pressure belts: Thermal belts (Equatorial Low Pressure Belt / Doldrums / ITCZ, Polar Highs), Dynamic belts (Subtropical High Pressure Belts / Horse Latitudes at 30-35 deg, Subpolar Low Pressure Belts at 60-65 deg); Tricellular meridional circulation cells: Hadley Cell (tropical convection and subtropical subsidence), Ferrel Cell (mid-latitude indirect circulation), Polar Cell; Seasonal latitudinal migration of pressure belts tracking the apparent movement of the Sun.",
            "entities": ["Equatorial Low / ITCZ Doldrums", "Subtropical High / Horse Latitudes", "Subpolar Lows & Polar Highs", "Hadley, Ferrel & Polar Cells", "Pressure Belt Seasonal Shifting"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "coriolis_force_geostrophic_winds_jet_streams",
            "name": "Coriolis Force, Geostrophic Winds & Polar Jet Streams",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts",
            "description": "Mechanics of wind: Pressure Gradient Force, Friction; Coriolis Force (apparent deflection proportional to wind velocity and sine of latitude, zero at equator, maximum at poles); Ferrel's Law (deflection to right in Northern Hemisphere, left in Southern Hemisphere); Geostrophic Winds (frictionless upper-air winds blowing parallel to straight isobars where PGF balances Coriolis); Jet Streams: Narrow meandering bands of high-velocity upper-tropospheric winds (Polar Jet Stream, Subtropical Westerly Jet Stream, Tropical Easterly Jet Stream, Rossby Waves and index cycle).",
            "entities": ["Coriolis Force & Ferrel's Law", "Pressure Gradient Force", "Geostrophic Wind Equilibrium", "Polar Front Jet Stream", "Subtropical Westerly Jet Stream", "Rossby Waves Index Cycle"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "planetary_winds_and_local_regional_winds",
            "name": "Planetary Winds & World Regional Local Winds",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts",
            "description": "Primary planetary winds: Trade Winds (Northeast and Southeast Trades), Prevailing Westerlies (Roaring Forties, Furious Fifties, Shrieking Sixties in open Southern Ocean), Polar Easterlies; Periodic daily winds: Land and sea breezes, Anabatic (upslope daytime valley breeze) vs Katabatic (downslope nighttime mountain wind); Regional hot winds: Loo (Indo-Gangetic plain), Chinook (snow-eater, eastern Rockies), Foehn (Alps), Sirocco (Sahara to Mediterranean), Harmattan (Doctor wind, West Africa), Khamsin; Regional cold winds: Mistral (Rhone valley France), Bora (Adriatic coast), Blizzard (polar prairies), Pampero (Argentina pampas).",
            "entities": ["Trade Winds & Prevailing Westerlies", "Roaring Forties & Furious Fifties", "Land and Sea Breezes", "Anabatic & Katabatic Winds", "Hot Winds (Chinook, Harmattan, Loo, Foehn)", "Cold Winds (Mistral, Bora, Blizzard)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: atmospheric_moisture_condensation_precipitation (NEW TOPIC)
        {
            "slug": "humidity_dew_point_condensation_forms_fog",
            "name": "Atmospheric Humidity, Dew Point & Fog Types",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation",
            "description": "Moisture metrics: Absolute humidity (mass of water vapor per unit volume), Specific humidity (mass of vapor per mass of moist air), Relative Humidity (RH = actual vapor pressure / saturation vapor pressure * 100%, inversely proportional to temperature); Dew Point temperature and hygroscopic condensation nuclei; Non-cloud condensation: Dew, White frost, Mist, Haze; Fog genesis and types: Radiation fog (ground radiative cooling on calm winter nights), Advection fog (warm moist air advecting over cold surface, Grand Banks), Upslope fog, Evaporation fog / steam fog.",
            "entities": ["Absolute, Specific & Relative Humidity", "Dew Point Temperature", "Hygroscopic Nuclei", "Radiation Fog & Smog", "Advection Fog (Sea Fog)", "Dew and White Frost"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "clouds_classification_and_rainfall_mechanisms",
            "name": "Cloud Classification (10 Genera) & Rainfall Types",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation",
            "description": "International Cloud Atlas 10 standard cloud genera by altitude: High clouds (Cirrus feathery ice crystals, Cirrostratus lunar/solar halos, Cirrocumulus mackerel sky), Middle clouds (Altostratus, Altocumulus), Low clouds (Stratus low grey overcast, Stratocumulus, Nimbostratus continuous heavy rain), Clouds of vertical development (Cumulus cauliflower fair weather, Cumulonimbus towering anvil thunderheads with lightning and hail); Precipitation physics: Collision-coalescence in warm clouds and Bergeron-Findeisen ice process in cold clouds; Rainfall mechanisms: Convectional (afternoon 4 o'clock showers), Orographic / Relief (heavy windward vs dry leeward rain-shadow), Cyclonic / Frontal.",
            "entities": ["10 Cloud Genera Classification", "Cirrus, Stratus & Cumulus", "Cumulonimbus Anvil Thunderheads", "Haloes in Cirrostratus", "Bergeron-Findeisen Rain Process", "Convectional, Orographic & Frontal Rainfall"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: air_masses_fronts_cyclogenesis
        {
            "slug": "air_masses_and_frontal_frontogenesis_types",
            "name": "Air Masses Classification & Frontogenesis (Warm, Cold, Occluded)",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis",
            "description": "Air mass definition and source regions: Continental Polar (cP, bitterly cold and stable), Maritime Polar (mP, cool and humid), Continental Tropical (cT, hot and arid), Maritime Tropical (mT, warm and highly unstable); Frontogenesis (creation of fronts) and Frontolysis (dissipation); Front types: Warm Front (gentle slope 1:200, cirrus-altostratus-nimbostratus sequence, broad steady rain), Cold Front (steep slope 1:50, violent cumulonimbus, squall line storms, abrupt post-frontal temperature drop), Occluded Front (cold front overtakes warm front lifting warm air completely), Stationary Front.",
            "entities": ["Air Mass Source Regions (cP, mP, cT, mT)", "Warm Front Cloud Sequence", "Cold Front Squall Lines", "Occluded Front Mechanics", "Frontogenesis and Frontolysis"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "temperate_wave_cyclones_vs_tropical_cyclones",
            "name": "Temperate Frontal Cyclones vs Tropical Cyclones",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis",
            "description": "Comparative cyclonic meteorology: Extra-tropical / Temperate Wave Cyclones (Polar Front Theory of Bjerknes, formation along polar front 35-65 deg, steer from west to east by Westerlies, vast scale >1000km, presence of distinct warm and cold fronts, active over land and sea, year-round); Tropical Cyclones (Thermal engine driven by latent heat of condensation, strictly over warm seas SST > 27 deg C, Coriolis force required, absence of fronts, steer east to west by Trade winds, rapid dissipation over land); Anatomy: Eye (calm, sinking air, clear sky), Eyewall (maximum torrential fury, gale force winds >120 km/h), Spiral rainbands; Storm surge flooding hazard; Regional names: Cyclones (Indian Ocean), Typhoons (Northwest Pacific), Hurricanes (Atlantic/Caribbean), Willy-Willies (Australia).",
            "entities": ["Temperate Wave Cyclones (Bjerknes)", "Tropical Cyclone Thermal Engine", "Sea Surface Temperature (>27 deg C)", "Eye, Eyewall & Rainbands", "Storm Surge Hazards", "Regional Names (Typhoon, Hurricane, Cyclone)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: world_climate_regions
        {
            "slug": "koppen_climate_classification_and_biomes",
            "name": "Köppen Climate Classification System & World Biomes",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.world_climate_regions",
            "description": "Wladimir Köppen's empirical climatic classification: Major groups: A (Tropical humid), B (Dry/Arid), C (Warm temperate/Mesothermal), D (Cold snow-forest/Microthermal), E (Polar), H (Highland); Major world biomes: Equatorial Rainforest (Af, Selvas, layered emergent canopy, buttress roots, absence of winter), Tropical Monsoon (Am, seasonal deciduous teak/sal), Tropical Savanna (Aw, Sudan type, tall elephant grass, big game country), Hot Deserts (BWh, xerophytic adaptations, subtropical subsidence), Mediterranean Climate (Cs, winter rain, summer drought, sclerophyllous chaparral vegetation, citrus viticulture), Marine West Coast (Cfb, British type, temperate deciduous forests), Taiga (Df, boreal coniferous evergreen needle-leaf softwood forests), and Tundra (ET, permafrost, lichens and mosses).",
            "entities": ["Köppen Empirical Climate Scheme", "Equatorial Selvas Rainforest (Af)", "Tropical Savanna Sudan Type (Aw)", "Mediterranean Winter Rain (Cs)", "Marine West Coast British Type (Cfb)", "Taiga Boreal Coniferous (Df)", "Tundra Permafrost Biome (ET)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: hydrological_cycle_and_water_balance (NEW TOPIC)
        {
            "slug": "global_hydrological_cycle_and_water_balance",
            "name": "Global Hydrological Cycle & Global Water Budget",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.hydrological_cycle_and_water_balance",
            "description": "Earth's water distribution: 97.2% saline in oceans, 2.8% freshwater (68.7% in ice caps and glaciers, 30.1% in groundwater, 0.3% in lakes and rivers, 0.04% in atmosphere); Hydrological Cycle components: Evaporation, Transpiration (Evapotranspiration), Condensation, Precipitation, Infiltration, Percolation, Surface runoff, and Groundwater flow; Global water budget balancing ocean excess evaporation vs land excess precipitation.",
            "entities": ["Global Freshwater Distribution", "Hydrological Cycle Mechanics", "Evapotranspiration & Runoff", "Infiltration and Percolation", "Global Water Budget Equilibrium"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: groundwater_hydrology_and_aquifers (NEW TOPIC)
        {
            "slug": "groundwater_hydrology_aquifers_and_springs",
            "name": "Groundwater Hydrology: Water Table, Aquifers & Springs",
            "parentId": f"{SUBJECT_ID}.climatology_atmospheric_dynamics.groundwater_hydrology_and_aquifers",
            "description": "Subsurface hydrology: Zone of aeration / Vadose zone (soil moisture, capillary fringe) vs Zone of saturation / Phreatic zone; Water Table (fluctuating upper limit of saturation); Porosity vs Permeability; Aquifers: Unconfined (water table aquifer), Confined / Artesian aquifer (trapped between impermeable aquitards/aquicludes under hydrostatic pressure, artesian wells); Perched water table; Natural springs and geysers (Old Faithful, geothermal groundwater heated by magma); Groundwater depletion, saltwater intrusion in coastal aquifers, and artificial recharge.",
            "entities": ["Water Table & Phreatic Zone", "Vadose / Aeration Zone", "Unconfined vs Confined Aquifers", "Artesian Wells & Hydrostatic Pressure", "Aquitards and Aquicludes", "Groundwater Depletion & Recharge"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # -------------------------------------------------------------
        # Domain 3: Oceanography & Marine Systems
        # -------------------------------------------------------------
        # Topic: ocean_floor_relief_features
        {
            "slug": "ocean_bottom_relief_shelf_slope_abyssal_plains",
            "name": "Ocean Bottom Relief: Continental Shelf, Slope, Rise & Abyssal Plains",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_floor_relief_features",
            "description": "Hypsographic curve of Earth's surface; Major oceanic provinces: Continental Shelf (gently sloping platform <1 deg, width 80km to 1500km in Siberian shelf, shallow depth <200m, richest marine life, commercial fisheries like Grand Banks of Newfoundland and Dogger Bank, offshore petroleum like Mumbai High), Continental Slope (steep incline 2-5 deg marking boundary of continental crust), Continental Rise (gradual apron of turbidity current sediment), and Abyssal Plains (flattest smoothest regions on Earth at depth 3000-6000m, blanketed in pelagic red clay and biogenous oozes).",
            "entities": ["Hypsographic / Hypsometric Curve", "Continental Shelf (Fisheries & Oil)", "Continental Slope & Continental Rise", "Turbidity Currents & Sediment Aprons", "Abyssal Plains (Pelagic Oozes)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "submarine_canyons_trenches_mid_oceanic_ridges",
            "name": "Submarine Canyons, Trenches, Mid-Ocean Ridges & Guyots",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_floor_relief_features",
            "description": "Submarine Canyons (deep V-shaped valleys gouged across continental shelf and slope, e.g., Hudson Canyon, Indus Canyon, Swatch of No Ground); Mid-Oceanic Ridges (continuous 65,000km undersea volcanic mountain chain, central rift valley, hydrothermal vents / black smokers, Mid-Atlantic Ridge, Southwest Indian Ridge); Deep-Sea Trenches (narrow V-shaped subduction chasms: Mariana Trench Challenger Deep 10,994m, Puerto Rico Trench, Sunda/Java Trench); Seamounts (submerged volcanic cones >1000m) and Guyots (flat-topped wave-truncated seamounts).",
            "entities": ["Submarine Canyons (Swatch of No Ground)", "Mid-Oceanic Ridge Central Rift", "Hydrothermal Vents (Black Smokers)", "Mariana Trench Challenger Deep", "Seamounts and Flat-Topped Guyots"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: ocean_water_dynamics (Ocean Movements: Waves, Tides & Currents)
        {
            "slug": "ocean_temperature_salinity_density_stratification",
            "name": "Ocean Temperature, Salinity & Density Profiles (Thermocline, Halocline)",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_water_dynamics",
            "description": "Physicochemical stratification: Temperature profile: Warm epipelagic mixed layer, Thermocline (rapid temperature decline between 200m-1000m), Cold deep layer; Factors affecting surface temperature: Latitude, upwelling, ocean currents; Salinity: Global average 35 practical salinity units (psu or ‰), Halocline (rapid salinity gradient); Drivers: Evaporation, precipitation, river discharge, ice melting; High-salinity water bodies (Lake Van 330‰, Dead Sea 240‰, Great Salt Lake 220‰, Red Sea 41‰) vs Low-salinity bodies (Baltic Sea 2-7‰, Black Sea); Pycnocline (density stratification zone combining temperature and salinity).",
            "entities": ["Thermocline Temperature Layering", "Halocline Salinity Stratification", "Pycnocline Density Zone", "Average Ocean Salinity (35‰)", "High Salinity Seas (Red Sea, Dead Sea)", "Low Salinity Seas (Baltic Sea)"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "ocean_waves_mechanics_and_wave_energy",
            "name": "Ocean Waves: Mechanics, Wave Parameters & Energy",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_water_dynamics",
            "description": "Wave physics: Wind blowing over fetch generating surface orbital motion; Wave Anatomy: Crest (highest point), Trough (lowest point), Wave Height (vertical distance from trough to crest), Wavelength (horizontal distance between two consecutive crests), Wave Period (time for one wavelength to pass a point), Wave Frequency; Orbital motion of water particles decaying with depth (wave base = wavelength / 2); Shoaling in shallow water where friction slows wave base, steepens wave height, and creates breaking surf (Spilling, Plunging, Surging breakers); Constructive vs Destructive waves shaping coastal morphology.",
            "entities": ["Wave Anatomy (Crest, Trough, Height, Period)", "Wind Fetch and Wind Duration", "Orbital Particle Motion & Wave Base", "Wave Shoaling & Breakers (Surf Zone)", "Constructive vs Destructive Waves"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "tides_mechanics_types_and_amphidromic_systems",
            "name": "Tides: Gravitational Forces, Syzygy, Quadrature & Tidal Bores",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_water_dynamics",
            "description": "Tide generating forces: Differential gravitational attraction of Moon (dominant 2.17x greater) and Sun, balanced by centrifugal force creating two tidal bulges on opposite sides of Earth; Astronomical tidal cycles: Spring Tides (Syzygy alignment: Conjunction/New Moon and Opposition/Full Moon when lunar and solar gravitational forces reinforce each other producing highest tidal range); Neap Tides (Quadrature alignment: First and Third Quarter moons when Sun and Moon act at right angles producing lowest tidal range); Diurnal (one high, one low daily), Semidiurnal (two equal highs, two equal lows daily), Mixed tides; Tidal bore phenomena (steep turbulent wall of water rushing up shallow estuaries, Hooghly River, Qiantang River China, Bay of Fundy world's highest tides 16m); Amphidromic points (cotidal nodal points where tidal range is zero).",
            "entities": ["Tidal Bulges (Moon & Sun Gravitational Forces)", "Spring Tides (Syzygy Alignment)", "Neap Tides (Quadrature 90 deg)", "Semidiurnal & Diurnal Tides", "Tidal Bore (Hooghly River)", "Bay of Fundy Extreme Tidal Range (16m)", "Amphidromic Nodal Points"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "ocean_currents_gyres_thermohaline_and_enso",
            "name": "Ocean Currents: Global Gyres, Thermohaline Circulation & ENSO Dynamics",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.ocean_water_dynamics",
            "description": "Ocean circulation systems: Surface wind-driven circulation: Five major Subtropical Gyres (North/South Atlantic, North/South Pacific, Indian Ocean) circulating clockwise in Northern Hemisphere and counter-clockwise in Southern Hemisphere; Boundary currents: Western Boundary Currents (narrow, deep, swift warm currents: Gulf Stream, Kuroshio, Brazil, Agulhas) vs Eastern Boundary Currents (broad, shallow, slow cold currents: California, Canaries, Benguela, Peru / Humboldt); Sargasso Sea (calm weed-filled eddy enclosed by Atlantic gyre); Seasonal reversal of North Indian Ocean currents (Southwest Monsoon Drift eastward vs Northeast Monsoon Drift westward); Thermohaline Circulation / Global Conveyor Belt driven by cold saline North Atlantic Deep Water (NADW) formation; Upwelling and coastal fisheries; ENSO teleconnections: Walker Circulation, El Niño (suppression of Peruvian upwelling, global climate anomalies), La Niña, and Indian Ocean Dipole (IOD).",
            "entities": ["Five Subtropical Ocean Gyres", "Western Boundary Currents (Gulf Stream, Kuroshio)", "Eastern Boundary Currents (Humboldt, Canaries)", "Sargasso Sea", "North Indian Ocean Monsoon Reversal", "Thermohaline Conveyor Belt (NADW)", "Coastal Upwelling & Fisheries", "ENSO (El Niño & La Niña) & IOD"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },

        # Topic: marine_ecosystems_conservation
        {
            "slug": "coral_reefs_ecosystems_darwin_subsidence_bleaching",
            "name": "Coral Reefs: Symbiosis, Darwin's Subsidence Theory & Bleaching",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.marine_ecosystems_conservation",
            "description": "Marine biodiversity hotspots: Hermatypic reef-building polyps in mutualistic symbiosis with photosynthetic Zooxanthellae dinoflagellates; Environmental requirements: Warm shallow tropical waters (20-28 deg C), depth <50m for light penetration, normal salinity 30-35‰, clear sediment-free water; Morphological reef types: Fringing Reefs, Barrier Reefs (Great Barrier Reef Australia), Atolls (Lakshadweep, Maldives); Formation theories: Charles Darwin's Subsidence Theory (fringing -> barrier -> atoll as volcanic island subsides), Reginald Daly's Glacial Control Theory; Coral Bleaching: Expulsion of zooxanthellae under elevated Sea Surface Temperatures and marine heatwaves; Ocean Acidification (carbonic acid reducing carbonate saturation needed for aragonite calcium carbonate skeletons).",
            "entities": ["Coral-Zooxanthellae Symbiosis", "Fringing, Barrier & Atoll Reefs", "Darwin's Subsidence Theory", "Coral Bleaching Thermal Triggers", "Ocean Acidification (Carbonate Saturation)", "Great Barrier Reef & Lakshadweep Atolls"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        },
        {
            "slug": "marine_resources_unclos_zones_blue_economy",
            "name": "Marine Resources (Polymetallic Nodules), UNCLOS Maritime Zones & Blue Economy",
            "parentId": f"{SUBJECT_ID}.oceanography_marine_systems.marine_ecosystems_conservation",
            "description": "Ocean economics and international law of the sea: Living resources (pelagic and demersal fisheries, mariculture, seaweed); Non-living marine resources: Polymetallic Nodules / Manganese Nodules on abyssal floor (rich in manganese, nickel, cobalt, copper; India's deep-sea mining exploration block in Central Indian Ocean Basin approved by International Seabed Authority / ISA under Deep Ocean Mission / Samudrayaan), Gas hydrates, Placer mineral sands (monazite, ilmenite on Kerala beaches); United Nations Convention on the Law of the Sea (UNCLOS) maritime zones: Baseline, Internal Waters, Territorial Sea (12 nautical miles, sovereign territory), Contiguous Zone (24 nm, fiscal/customs/immigration jurisdiction), Exclusive Economic Zone / EEZ (200 nm, exclusive sovereign rights to living and non-living resources), High Seas (global commons under ISA jurisdiction).",
            "entities": ["Polymetallic Nodules (Manganese Nodules)", "Deep Ocean Mission (Samudrayaan)", "International Seabed Authority (ISA)", "UNCLOS Maritime Zones (Territorial Sea 12nm)", "Exclusive Economic Zone (EEZ 200nm)", "High Seas Global Commons", "Blue Economy Initiatives"],
            "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
        }
    ]

    # 5. Add all Level-4 subtopics
    added_subtopics = 0
    for sub in subtopics:
        parent_id = sub["parentId"]
        node_id = f"{parent_id}.{sub['slug']}"
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"Error: Parent {parent_id} not found for {sub['slug']}!")
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
            "subject": SUBJECT_NAME,
            "subjectId": SUBJECT_ID,
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
        if node_id not in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].append(node_id)

        added_subtopics += 1

    # 6. Recompute Stats
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

    print(f"\nPhysical Geography Enrichment completed successfully!")
    print(f"Added/Updated topics and {added_subtopics} Level-4 Subtopics.")
    print(f"New KG Total Nodes: {len(nodes)} (L1: {l1_count}, L2: {l2_count}, L3: {l3_count}, L4: {l4_count})")

if __name__ == "__main__":
    main()

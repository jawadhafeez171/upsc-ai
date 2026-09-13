# -*- coding: utf-8 -*-
import os
import requests
from dotenv import load_dotenv

load_dotenv('.env.local')
supabase_url = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
supabase_key = os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')

headers = {
    'apikey': supabase_key,
    'Authorization': f'Bearer {supabase_key}',
    'Content-Type': 'application/json'
}

obsolete_ids = [
    'geography_earth_systems.world_mapping_geopolitical_locations.major_world_rivers_lakes_drainage',
    'geography_earth_systems.world_mapping_geopolitical_locations.mountain_ranges_peaks_plateaus_world'
]

for oid in obsolete_ids:
    url = f"{supabase_url}/rest/v1/knowledge_nodes?id=eq.{oid}"
    resp = requests.delete(url, headers=headers)
    print(f"Deleted obsolete node {oid}: Status {resp.status_code}")

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

old_id = 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.ocean_currents_gyres_thermohaline_and_enso'
url = f"{supabase_url}/rest/v1/knowledge_nodes?id=eq.{old_id}"
resp = requests.delete(url, headers=headers)
print(f"Deleted old node {old_id}: Status {resp.status_code}")

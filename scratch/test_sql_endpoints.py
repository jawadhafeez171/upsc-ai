# -*- coding: utf-8 -*-
import json
import urllib.request
import urllib.error

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

endpoints = [
    ("/rest/v1/rpc/exec_sql", {"sql": "SELECT 1"}),
    ("/rest/v1/rpc/execute_sql", {"query": "SELECT 1"}),
    ("/rest/v1/rpc/run_sql", {"sql": "SELECT 1"}),
    ("/pg/query", {"query": "SELECT 1"}),
    ("/v1/query", {"query": "SELECT 1"})
]

for ep, body in endpoints:
    url = SUPABASE_URL + ep
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json"
    }
    data = json.dumps(body).encode('utf-8')
    req = urllib.request.Request(url, data=data, headers=headers, method="POST")
    try:
        with urllib.request.urlopen(req) as resp:
            print(f"{ep} SUCCESS: {resp.status} {resp.read().decode('utf-8')}")
    except urllib.error.HTTPError as e:
        print(f"{ep} HTTPError {e.code}: {e.read().decode('utf-8')[:100]}")
    except Exception as e:
        print(f"{ep} Error: {e}")

import urllib.request
import urllib.error
import json

SUPABASE_URL = "https://oazgwzctyjowxnvbhiud.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hemd3emN0eWpvd3hudmJoaXVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMyMzE5ODEsImV4cCI6MjA4ODgwNzk4MX0.DvOTMoqNVJjPMiXGw4nhwmY0AXAcsUONAEzrkQfBrP0"

# Check available RPCs or table definitions
for rpc_name in ['exec_sql', 'execute_sql', 'run_sql', 'sql']:
    url = f"{SUPABASE_URL}/rest/v1/rpc/{rpc_name}"
    headers = {
        "apikey": SUPABASE_KEY,
        "Authorization": f"Bearer {SUPABASE_KEY}",
        "Content-Type": "application/json"
    }
    req = urllib.request.Request(url, data=b'{"query":"SELECT 1;"}', headers=headers, method="POST")
    try:
        with urllib.request.urlopen(req) as resp:
            print(f"RPC {rpc_name} exists! Status: {resp.status}")
    except urllib.error.HTTPError as e:
        print(f"RPC {rpc_name}: {e.code}")
    except Exception as e:
        print(f"RPC {rpc_name} error: {e}")

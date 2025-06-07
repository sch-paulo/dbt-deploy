'''
File to detect the environment variables from .env when running "dbt debug"
'''
import os
from dotenv import load_dotenv
import subprocess

# Load environment variables from .env
load_dotenv(dotenv_path="../.env")

# Run dbt debug (or any dbt command)
# subprocess.run(["dbt", "debug"])
subprocess.run(["dbt", "docs", "generate"])

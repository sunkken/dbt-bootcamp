import os
from pathlib import Path

from dagster_dbt import DbtProject

DBT_DIR = Path(__file__).joinpath("..", "..", "..", "transform").resolve()

airbnb_project = DbtProject(
    project_dir=DBT_DIR,
    target_path=DBT_DIR.joinpath("target"),
    profiles_dir=Path(os.path.expanduser("~")).joinpath(".dbt").resolve(),
)
airbnb_project.prepare_if_dev()
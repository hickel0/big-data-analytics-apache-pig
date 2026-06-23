# Big Data Analytics with Apache Pig

[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=flat-square&logo=python&logoColor=white)](https://python.org)
[![Apache Pig](https://img.shields.io/badge/Apache%20Pig-Big%20Data-red?style=flat-square)](https://pig.apache.org/)
[![Google Cloud](https://img.shields.io/badge/GCP-DataProc-4285F4?style=flat-square&logo=google-cloud&logoColor=white)](https://cloud.google.com/dataproc)
[![Status](https://img.shields.io/badge/Status-Complete-success?style=flat-square)](.)

Large-scale data processing and analytics using Apache Pig for distributed computing and Python for traditional analysis.

## Project Overview

**Course**: CSC1109 - Data Storage Systems / Big Data Analytics
**Focus**: Distributed Computing & Comparative Analytics
**Status**: Completed

This project demonstrates big data processing capabilities using:
- Apache Pig for distributed data transformation
- Google DataProc for cloud-based processing
- Python for traditional analytics comparison

## Repository Structure

```
DSS/
├── Project/
│   ├── TeamAnalysis.ipynb                  # Team performance analysis
│   ├── Team_Traditional_Analysis.ipynb    # Traditional Python approach
│   ├── Combined_Analysis.ipynb            # Combined insights
│   ├── team_processing.pig                # Pig script for team data
│   ├── combined_processing.pig            # Combined Pig processing
│   ├── Visualisations/                    # Output charts
│   └── team_joined/                       # Processed data output
├── 2026-csc1109-assignment2/
│   └── 2026-csc1109-assignment2-main/
│       ├── TeamAnalysis.ipynb
│       ├── Team_Traditional_Analysis.ipynb
│       ├── team_processing.pig
│       ├── combined_processing.pig
│       ├── outputs/                       # Pig output files
│       ├── Visualisations/                # Analysis charts
│       └── Report/                        # Final documentation
├── Google DataProc/
│   ├── Assignment1_Google_DataProc.pdf    # Cloud deployment guide
│   ├── Assignment2_Cloud_Deployment.pdf   # Advanced deployment
│   └── [Screenshots of cloud execution]
├── Lecs/
│   ├── Weeks 1 - 6/                       # Hadoop, MapReduce, Hive, Pig
│   └── Weeks 6 - 12/                      # Spark, Storm, ML at Scale
└── cleaning.pig                            # Data cleaning script
```

## Key Components

### Apache Pig Scripts
- **team_processing.pig** - Aggregates team statistics
- **combined_processing.pig** - Joins and transforms multiple datasets
- **cleaning.pig** - Data quality and preprocessing

### Analysis Notebooks
- **TeamAnalysis.ipynb** - Big data approach using Pig outputs
- **Team_Traditional_Analysis.ipynb** - Traditional Pandas approach
- **Combined_Analysis.ipynb** - Comparative insights and visualizations

### Cloud Deployment
- Google DataProc cluster setup
- Cloud-based Pig execution
- PySpark integration

## Technologies Used

### Big Data Stack
- **Apache Pig** - High-level data flow language
- **Apache Hadoop** - Distributed storage and processing
- **Google DataProc** - Managed Hadoop/Spark clusters
- **PySpark** - Python API for Spark

### Analytics Stack
- **Python 3.10+**
- **Pandas** - Data manipulation
- **Matplotlib & Seaborn** - Visualization
- **Jupyter Notebooks** - Interactive analysis

## Setup & Installation

### Local Setup
```bash
# Navigate to project
cd "DSS/Project"

# Install Python dependencies
pip install pandas matplotlib seaborn jupyter

# Run analysis notebooks
jupyter notebook TeamAnalysis.ipynb
```

### Cloud Setup (Google DataProc)
1. Create DataProc cluster on GCP
2. Upload Pig scripts to Cloud Storage
3. Submit Pig jobs via console or gcloud CLI
4. Download results for visualization

## Results & Visualizations

### Generated Outputs
- Team performance comparisons
- Win rate analysis
- Point differential trends
- Hybrid scoring metrics
- Heatmaps and radar charts

### Key Findings
- Demonstrated scalability of Pig for large datasets
- Compared processing time: Big Data vs Traditional approaches
- Identified performance patterns across teams
- Created reproducible analytics pipeline

## Comparative Analysis

| Approach | Pros | Cons |
|----------|------|------|
| Apache Pig | Scales to TB+, Distributed | Setup complexity |
| Traditional Python | Simple, Fast iteration | Memory limited |
| Cloud (DataProc) | Managed, Scalable | Cost |

## Learning Outcomes

- Hadoop ecosystem fundamentals
- Writing Pig Latin scripts
- Cloud deployment with DataProc
- Comparing distributed vs local processing
- Data visualization at scale

## Author

**Lee Hickey** - Dublin City University

---

*Academic Project - CSC1109 Big Data Analytics*

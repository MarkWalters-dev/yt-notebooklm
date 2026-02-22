# 2024-12-15 Human Skin Rejuvenation - Li Li PhD

## Executive Summary

*   A comprehensive human skin single-cell atlas was developed, revealing specific cellular and genetic changes during photoaging and chronological aging.
*   Skin stem cells (basal stem cells 3, 4, and 6) are significantly depleted during aging, with keratinocytes identified as playing a central role in the aging process.
*   Activating Transcription Factor 3 (ATF3) in keratinocytes was identified as a key regulatory gene; its downregulation contributes to increased cellular senescence and decreased proliferation in aging skin.
*   Localized mRNA treatment designed to upregulate ATF3 expression in older keratinocytes successfully reversed aging phenotypes in vitro, reducing senescence markers, increasing cell proliferation by 20-25%, and boosting collagen production in fibroblasts by 200%.
*   The study demonstrated a critical crosstalk mechanism where keratinocytes, influenced by ATF3, secrete proteins (e.g., Collagen 17A1) that modulate fibroblast activity, leading to reduced senescence and increased collagen synthesis in fibroblasts.

## Skin Aging Overview

Skin aging is characterized by visible changes such as wrinkles and dryness. At a microscopic level, changes occur in the epidermis, elastin, and collagen. Understanding photoaging (UV-induced) and chronological aging at a molecular level has been limited, with most studies focusing on fibroblasts and collagen, overlooking other cell types and key driving factors.

## Experimental Design and Single-Cell Atlas

To comprehensively understand skin aging, samples were collected from individuals across young, middle, and older ages, covering both photoaging and chronological aging.

### Sample Collection Protocol

1.  **Participants:** Individuals across different age groups (young, middle, old).
2.  **Sampling Sites:**
    *   **Arm:** Represents photoaging plus chronological aging (sun-exposed).
    *   **Back:** Represents chronological aging only (less sun-exposed).
3.  **Analysis:** Single-cell RNA sequencing (scRNA-seq) was performed on collected samples.

### Rationale for Single-Cell Analysis

Skin is a heterogeneous tissue composed of various cell types (keratinocytes, melanocytes, fibroblasts, immune cells, etc.). Bulk RNA-seq would average gene expression across all cell types, obscuring specific cellular contributions to aging. Single-cell RNA-seq allows for the identification of specific gene changes within each cell type, providing a higher resolution understanding of the aging process and helping pinpoint key driving genes.

### Skin Tissue Dissociation Protocol

A custom skin tissue dissociation protocol was developed to maximize cell capture and preserve diverse cell types for scRNA-seq. This protocol aims for better resolution in understanding skin cells and developing targeted treatments.

### Human Skin Atlas

Over 61,000 cells were collected across different age groups, resulting in the most comprehensive human skin atlas to date, covering both photoaging and chronological aging. This atlas functions as an "aging map," detailing cellular changes from young to old individuals and highlighting specific cell type roles.

The atlas includes various skin cell types:
*   Basal cells
*   Spinous cells
*   Granular cells
*   Endothelial cells
*   Hair follicles
*   Other cell types

Marker genes for each subcluster were identified (e.g., keratin 15, keratin 14 for basal cells).

## Cellular Changes During Aging

Analysis of the skin atlas revealed distinct cellular patterns in different aging types:

*   **Combined Aging (Photoaging + Chronological Aging):** Changes in cell percentages were observed, with a clear pattern of increased immune cells.
*   **Chronological Aging:** Showed a clear pattern of changes in basal cells and an increase in immune cells, consistent with current research linking aging to the immune system.

### Quantitative Analysis of Cell Subtypes

Detailed quantitative analysis showed that skin stem cells, specifically basal stem cells three, four, and six, were significantly depleted during the aging process. This provides evidence for the depletion of skin stem cells contributing to skin aging.

### Differential Expressed Genes (DEGs)

Differential gene expression analysis comparing combined aging and chronological aging showed:

*   **Combined Aging:** Involved a greater number of differentially expressed genes, which is expected due to the inclusion of photoaging. Photoaging causes a "connected response" where UV exposure affects multiple cell types simultaneously.
*   **Chronological Aging:** DEGs were more localized to specific cell types.
*   **Shared DEGs:** Combined aging also exhibited shared DEGs across different cell types, indicating a broader, interconnected response.

Gene Ontology (GO) analysis validated these findings, showing that combined aging DEGs were related to general phenotypes, while photoaging DEGs involved specific cell organelles and parts.

## Identification of Key Genes

Focusing on keratinocytes, which include human skin stem cells, an in-house algorithm was used for gene clustering, identifying eight clusters. Two notable clusters emerged:

*   **Increased Expression Cluster:** Genes in this group showed increased expression during both combined and chronological aging and were enriched in granular cells.
*   **Decreased Expression Cluster:** Genes in this group showed decreased expression during aging and were enriched in stem cells.

Network analysis identified **ATF3 (Activating Transcription Factor 3)** as a central "hub gene" in the decreased expression cluster. ATF3 expression levels were validated across multiple studies and datasets, confirming its role in the aging process.

## ATF3 Validation

### In Vitro Knockdown Experiment Protocol

1.  **Cell Seeding:** Young keratinocytes were seeded.
2.  **siRNA Knockdown:** siRNA was used to reduce ATF3 mRNA expression in these cells.
3.  **Measurement (post-knockdown):**
    *   Beta-galactosidase (β-gal): A senescence marker.
    *   Ki-67: A cell proliferation marker.
    *   SASP (Senescence-Associated Secretory Phenotype): Senescence marker genes.

### Knockdown Results

*   **SASP:** Expression of senescence-related marker genes significantly increased after ATF3 knockdown, indicating ATF3's role in cell senescence.
*   **Cell Proliferation (Ki-67):** Cells showed reduced proliferation after ATF3 knockdown, mimicking the slower proliferation seen in aging cells.
*   **Senescence Status (β-gal):** ATF3 knockdown induced a senescent state in cells, which were initially non-senescent.

These results validated that ATF3 plays a role in the aging process at the cellular level.

## mRNA Treatment Development for Skin Rejuvenation

Leveraging the success of mRNA technology in vaccines, an in-house mRNA treatment for skin rejuvenation targeting ATF3 was developed.

### mRNA Design for ATF3

The specific mRNA design includes:
*   Specific UTRs (Untranslated Regions)
*   The ATF3 gene sequence
*   HbA1 UTR tails

This design ensures controlled expression and targeted delivery to skin cells.

### mRNA Treatment Validation Protocol

1.  **Cell Seeding:** Older keratinocytes were seeded.
2.  **mRNA Treatment Application:** The synthesized ATF3 mRNA was applied to the older cells.
3.  **Measurement (post-72 hours):**
    *   Beta-galactosidase (β-gal)
    *   Ki-67
    *   SASP markers

### mRNA Treatment Results

*   **Senescent Markers:** The ATF3 mRNA therapy significantly decreased the expression of senescent markers (e.g., IL-1 beta, IL-6, IL-8), showing several-fold changes.
*   **Cell Proliferation:** Cell proliferation increased by 20-25% compared to control cells after treatment.
*   **Senescence Status:** A significant reduction in senescence status was observed, with cells returning to a "younger" status from a senescent state.

## Mechanism of Action: Keratinocyte-Fibroblast Crosstalk

Skin cells communicate through paracrine signaling. Keratinocytes were found to have strong interactions with endothelial cells and fibroblasts.

### Genes Involved in Crosstalk

*   **Keratinocytes:** Secreted proteins including Collagen 17A1 (a known gene involved in skin aging).
*   **Fibroblasts:** Express collagen integrin complexes (A1B1, A11B1, A2B1), which are binding sites for collagen.

This suggests that keratinocytes secrete proteins that interact with these integrins on fibroblasts, influencing their activity.

### Experimental Validation of Crosstalk

To validate this computational finding, a conditioned medium experiment was conducted:

1.  **Conditioned Medium Preparation:**
    *   Young keratinocyte conditioned medium.
    *   Old keratinocyte conditioned medium.
    *   ATF3 mRNA-treated keratinocyte conditioned medium.
    *   Control (untreated old keratinocyte) conditioned medium.
2.  **Fibroblast Treatment:** Fibroblasts were treated with these different conditioned media.
3.  **Measurement:** Cell senescence and collagen production were measured in the fibroblasts.

### Crosstalk Validation Results

*   **Young Keratinocyte Medium:** Fibroblasts treated with young keratinocyte medium showed less senescence and a four-fold increase in collagen production (three times more than old keratinocyte medium).
*   **ATF3 mRNA Treatment:** Fibroblasts treated with conditioned medium from ATF3 mRNA-treated keratinocytes showed reduced senescence and a 200% increase in collagen production compared to controls.

## Summary and Future Outlook

Keratinocytes are a critical target cell type in skin aging, and ATF3 is a key driven gene. ATF3 in keratinocytes influences fibroblast activity and collagen production through secreted proteins.

The proposed skin rejuvenation strategy involves delivering ATF3 mRNA encapsulated in lipid nanoparticles (LNPs) via microneedles.

## Future Directions and Clinical Implications

### Systemic Effects

Initial studies focus on skin aging. Future plans include investigating systemic effects on other tissues, starting with muscles due to their proximity to skin, and potentially the brain.

### Viral Burden and Safety

The mRNA treatment is designed for local skin delivery using specific UTRs to ensure expression only in skin cells. This localized delivery is intended to prevent systemic effects, such as the potential reactivation of senescent cell-infected viruses in other tissues, which could be a concern with non-localized ATF3 upregulation. Comprehensive gene expression changes are monitored after mRNA treatment to ensure safety and prevent unwanted off-target responses.

### Metabolomic Profile and Small Molecules

While ATF3 mRNA is translated into a protein that initiates a cascade of effects, the development of small molecule metabolites that might mimic ATF3's effects is also being explored. However, mRNA is currently advocated due to its:

*   **Control:** Easier to control expression levels.
*   **Effectiveness:** Generally more potent.
*   **Precision:** Specifically targets ATF3 mRNA, avoiding non-specific binding to other proteins that can occur with small molecules.
*   **Safety:** Reduced risk of immune responses or off-target effects compared to broad-acting metabolites.

### Skin Barrier Function and pH

Keratinocytes are integral to the epidermis, which controls skin barrier function and pH. The ATF3 treatment in keratinocytes is expected to improve these functions. *In vivo* studies are currently underway:

*   **Ex vivo skin:** Testing on ex vivo human skin models shows similar positive effects.
*   **Animal models:** Studies on wound healing and UV-induced aging in older mice, followed by pigs, are being conducted.

### Skin Microbiome

Future collaborations are planned to investigate how ATF3 mRNA treatment and the restoration of youthful skin affect the skin microbiome composition.

### Downregulation of ATF3 in Aging

The downregulation of ATF3 in aging skin is hypothesized to be linked to immune activation and increased inflammation during aging. ATF3 is an upstream gene in modules that include downstream genes related to the immune system. Follow-up studies are investigating ATF3 expression changes in inflammatory skin disorders like acne to better understand the interplay between inflammation, disease, and aging.

### Biomarkers for Skin Aging

Non-invasive biomarkers are being explored to assess skin health:

*   **Epidermal Tape:** A specific tape collects epidermal cells, allowing for epigenomic testing.
*   **Algorithm Development:** Algorithms are being developed to link epigenomic data from these tapes to transcriptome data to provide a precise "bio-index" of skin health and age. This aims to provide a more precise measure of skin health than traditional image-based assessments.

### ATF3 Expression Across Skin Types

Data from various skin locations, including the arm, back, and face, consistently show similar patterns of ATF3 downregulation with aging. Further data collection is ongoing to confirm this across a wider range of body sites.

### Clinical Translation and Timeline

The goal is to commercialize this research, moving from lab findings to publicly available products. The current process involves:

*   **Pre-clinical:** Ex vivo skin data.
*   **Animal Studies:** Testing on pig models.
*   **FDA Approval:** Application for FDA approval, with optimism given recent approvals for genomic and gene therapies.

The technology holds potential not only for aesthetic purposes but also for clinical applications such as wound healing, burn treatment, and other skin-related diseases, particularly beneficial for the older population who often experience impaired wound healing.

### Natural Methods for ATF3 Upregulation

Currently, no specific natural products or diets are definitively known to upregulate ATF3 expression in skin to the degree achieved by mRNA technology. However, the pathways related to metabolism and absorption in young vs. older skin align with general healthy lifestyle habits.

*   **Small Molecules:** While mRNA is the preferred modality for its precision and effectiveness, small molecule treatments are also being explored as a complementary approach.
*   **General Health:** Maintaining good skin health is generally linked to healthy habits such as regular exercise, a nutritious diet, and sufficient sleep, which influence metabolic pathways relevant to skin aging.

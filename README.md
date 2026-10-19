# Données d'exemple du *Manuel de bioinformatique IBT*

Ce dépôt rassemble, dans le dossier `données/`, les fichiers dont vous aurez besoin pour refaire les
exercices et les « pas à pas » du manuel (`Manuel-Bioinformatique-IBT.pdf`).
Ils sont classés par chapitre. Pour chaque chapitre, le tableau indique où le
fichier sert dans le manuel et ce qu'il contient.

Certains exercices partent d'une **base de données publique** plutôt que d'un
fichier : vous les trouverez dans la section
[Données à récupérer en ligne](#données-à-récupérer-en-ligne), avec un lien
direct vers chaque entrée.

---

## Sommaire

- [Données d'exemple du *Manuel de bioinformatique IBT*](#données-dexemple-du-manuel-de-bioinformatique-ibt)
  - [Sommaire](#sommaire)
  - [Récupérer les fichiers](#récupérer-les-fichiers)
  - [Arborescence](#arborescence)
  - [Fichiers par chapitre](#fichiers-par-chapitre)
    - [Chapitre 6 : Linux et la ligne de commande](#chapitre-6--linux-et-la-ligne-de-commande)
    - [Chapitre 8 : alignement de deux séquences](#chapitre-8--alignement-de-deux-séquences)
    - [Chapitre 9 : BLAST](#chapitre-9--blast)
    - [Chapitre 14 : construire un arbre](#chapitre-14--construire-un-arbre)
    - [Chapitre 18 : variation génétique humaine](#chapitre-18--variation-génétique-humaine)
    - [Compléments](#compléments)
  - [Données à récupérer en ligne](#données-à-récupérer-en-ligne)
  - [Noms de fichiers génériques dans les commandes](#noms-de-fichiers-génériques-dans-les-commandes)
  - [Origine des données](#origine-des-données)

---

## Récupérer les fichiers

**Tout le dépôt**, avec Git :

```bash
git clone https://github.com/SamsonHyacinth/ibt-2026.git
cd ibt-2026/données
```

**Un seul fichier** : ouvrez-le sur GitHub, puis cliquez sur **Raw** (ou sur
l'icône de téléchargement) et enregistrez la page.

> [!TIP]
> Les outils en ligne (NGPhylogeny.fr, EMBOSS, Clustal Omega, VEP…) acceptent
> le téléversement direct de ces fichiers. Vous pouvez aussi ouvrir n'importe
> quel FASTA dans un éditeur de texte et copier-coller son contenu dans le
> formulaire.

---

## Arborescence

```text
ibt-2026/
├── README.md
├── LICENSE
└── données/
    ├── chapitre-06-linux/
    │   ├── iris.csv
    │   ├── Variants_with_random_QUAL.vcf
    │   ├── chromosomes_positions_file.txt
    │   ├── AWK_script_update_IDs.sh
    │   └── create_bioinfo_files.sh
    ├── chapitre-08-alignement-paires/
    │   ├── FA9_Human.fasta
    │   └── FA12_Human.fasta
    ├── chapitre-09-blast/
    │   └── sequences_16S_bovins.fasta
    ├── chapitre-14-phylogenie/
    │   ├── hbb_primate_sequences.fas
    │   ├── Pol21.fas
    │   └── Pol21_aligne.meg
    ├── chapitre-18-variation-humaine/
    │   ├── genomics.human_genetic_variation.TaskVEP.vcf
    │   └── genes_CdLS.txt
    └── complements/
        ├── FOXP2_humain_proteine.fas
        ├── example_gene_1_cdna.fasta
        └── example_gene_1_protein.fasta
```

---

## Fichiers par chapitre

### Chapitre 6 : Linux et la ligne de commande

Le chapitre utilise des noms génériques (`sequences.fasta`, `reads.fastq.gz`,
`variants.vcf`…). Ces fichiers réels permettent de taper les commandes sur de
vraies données.

| Fichier | Format | Contenu | À quoi il sert |
|---|---|---|---|
| [`iris.csv`](données/chapitre-06-linux/iris.csv) | CSV | Le jeu de données classique *Iris* : 150 fleurs, 4 mesures, 3 espèces | S'exercer à `head`, `cut`, `sort`, `uniq`, `awk` sur un tableau |
| [`Variants_with_random_QUAL.vcf`](données/chapitre-06-linux/Variants_with_random_QUAL.vcf) | VCF 4.3 | 200 variants du chromosome 20 (1000 Genomes, GRCh38), colonne `ID` vide, `QUAL` aléatoire | `grep -v "^#"`, `wc -l`, filtrer sur la qualité avec `awk` |
| [`chromosomes_positions_file.txt`](données/chapitre-06-linux/chromosomes_positions_file.txt) | TSV | Table chromosome / position / rsID | Table de correspondance pour compléter les rsID du VCF |
| [`AWK_script_update_IDs.sh`](données/chapitre-06-linux/AWK_script_update_IDs.sh) | Bash + awk | Jointure sur les coordonnées : remplit la colonne `ID` du VCF à partir de la table | Exemple complet d'`awk` à deux fichiers (`NR==FNR`) |
| [`create_bioinfo_files.sh`](données/chapitre-06-linux/create_bioinfo_files.sh) | Bash | Génère `demo_sequences.fasta` (20 séquences), `demo_reads.fastq` (20 lectures) et `demo_expression.csv` | Créer en une commande de petits FASTA/FASTQ pour s'entraîner (`bash create_bioinfo_files.sh`) |

### Chapitre 8 : alignement de deux séquences

Utilisés dans le pas à pas **EMBOSS Water / EMBOSS Needle** et dans l'encadré
« Sortie EMBOSS Water ».

| Fichier | Format | Contenu | Où dans le manuel |
|---|---|---|---|
| [`FA9_Human.fasta`](données/chapitre-08-alignement-paires/FA9_Human.fasta) | FASTA protéique | Facteur IX de coagulation humain, UniProt [`P00740`](https://www.uniprot.org/uniprotkb/P00740/entry) | Ch. 8, alignement local puis global ; aussi ch. 3 (fiche UniProt) |
| [`FA12_Human.fasta`](données/chapitre-08-alignement-paires/FA12_Human.fasta) | FASTA protéique | Facteur XII de coagulation humain, UniProt [`P00748`](https://www.uniprot.org/uniprotkb/P00748/entry) | Ch. 8, seconde séquence de l'alignement |

### Chapitre 9 : BLAST

| Fichier | Format | Contenu | Où dans le manuel |
|---|---|---|---|
| [`sequences_16S_bovins.fasta`](données/chapitre-09-blast/sequences_16S_bovins.fasta) | FASTA nucléique | Les deux fragments d'ARNr 16S du microbiote fécal bovin (`sequence_1`, `sequence_2`) | Exercice « Identifier des séquences inconnues », tâche 1 : **blastn** contre *16S ribosomal RNA sequences* |

> [!NOTE]
> Ces deux séquences sont imprimées dans le manuel. Le fichier évite de les
> recopier depuis le PDF, ce qui introduit souvent des espaces ou des retours à
> la ligne parasites.

Pour la **tâche 2** (blastx, myoglobine), partez de la séquence codante de la
myoglobine humaine (gène *MB*, RefSeq
[`NM_005368`](https://www.ncbi.nlm.nih.gov/nuccore/NM_005368)) : sur la fiche
NCBI, **Send to → File → FASTA**, ou cliquez sur **CDS** pour n'en garder que la
partie codante.

### Chapitre 14 : construire un arbre

| Fichier | Format | Contenu | Où dans le manuel |
|---|---|---|---|
| [`hbb_primate_sequences.fas`](données/chapitre-14-phylogenie/hbb_primate_sequences.fas) | FASTA nucléique | Gène de la β-globine (*HBB*) chez 10 primates : humain, gorille, bonobo, siamang, orang-outan, gibbons, rhinopithèque, drill, singe de nuit | Mise en pratique 1, **NGPhylogeny.fr** (« Un arbre en cinq clics ») |
| [`Pol21.fas`](données/chapitre-14-phylogenie/Pol21.fas) | FASTA protéique | Polyprotéine POL de 20 rétrovirus : HIV-1, HIV-2, SIV et **HTLV-I** (groupe externe) | Exercice « Construire et comparer deux arbres dans MEGA » : point de départ (alignement avec MUSCLE) |
| [`Pol21_aligne.meg`](données/chapitre-14-phylogenie/Pol21_aligne.meg) | MEGA (`.meg`) | Les mêmes 20 séquences, **déjà alignées** | Pour vérifier votre alignement, ou passer directement à la construction des arbres ML et MP |

> [!IMPORTANT]
> `Pol21_aligne.meg` est en quelque sorte le corrigé de l'étape 1 de
> l'exercice. Essayez d'abord d'aligner `Pol21.fas` vous-même dans MEGA.

### Chapitre 18 : variation génétique humaine

| Fichier | Format | Contenu | Où dans le manuel |
|---|---|---|---|
| [`genomics.human_genetic_variation.TaskVEP.vcf`](données/chapitre-18-variation-humaine/genomics.human_genetic_variation.TaskVEP.vcf) | VCF (sans en-tête) | 260 variants d'une personne atteinte du **syndrome de Cornelia de Lange** (CdLS) | Exercice 7 (passer un VCF dans le VEP en ligne) et exercice 9 (prioriser les variants CdLS) |
| [`genes_CdLS.txt`](données/chapitre-18-variation-humaine/genes_CdLS.txt) | Texte, un gène par ligne | Les 7 gènes associés au CdLS : *NIPBL*, *RAD21*, *SMC3*, *SMC1A*, *HDAC8*, *SETD5*, *KMT2A* | Exercice 9 : filtre « gènes du phénotype » dans le VEP ou avec `filter_vep` |

> [!WARNING]
> Ce VCF réduit au strict minimum ne contient qu'une ligne d'en-tête
> (`#CHROM POS ID…`) et ne précise donc pas son assemblage de référence. Les
> variants portent tous un rsID : si le VEP signale que l'allèle de référence
> ne correspond pas (*reference allele mismatch*) pour beaucoup d'entre eux,
> relancez l'analyse sur l'autre assemblage
> ([GRCh38](https://www.ensembl.org/Homo_sapiens/Tools/VEP) ou
> [GRCh37](https://grch37.ensembl.org/Homo_sapiens/Tools/VEP)). Voir l'encadré
> du chapitre 16 sur les coordonnées qui changent d'un assemblage à l'autre.

### Compléments

Ces fichiers proviennent des séances pratiques du cours. Le manuel ne les cite
pas nommément, mais ils servent à refaire les pas à pas avec une séquence
connue.

| Fichier | Format | Contenu | Pour quel chapitre |
|---|---|---|---|
| [`FOXP2_humain_proteine.fas`](données/complements/FOXP2_humain_proteine.fas) | FASTA protéique | La protéine FOXP2 humaine (module 1, séance 3) | Ch. 3 (UniProt) et ch. 5 (pas à pas **InterProScan**) |
| [`example_gene_1_cdna.fasta`](données/complements/example_gene_1_cdna.fasta) | FASTA nucléique | L'ADNc d'un gène d'exemple (module 6, séance 2) | Ch. 9 (BLAST) et ch. 16 (retrouver le gène dans Ensembl) |
| [`example_gene_1_protein.fasta`](données/complements/example_gene_1_protein.fasta) | FASTA protéique | La protéine correspondante | Ch. 5 (InterProScan) et ch. 9 (blastp) |

---

## Données à récupérer en ligne

Ces exercices partent d'un identifiant plutôt que d'un fichier. Les liens
ouvrent directement l'entrée concernée.

| Identifiant | Base | Ce que c'est | Chapitres |
|---|---|---|---|
| [`AY157316.1`](https://www.ncbi.nlm.nih.gov/nuccore/AY157316.1) | NCBI Nucleotide | ARNm de *FOXP2* humain | 1, 2, 7 |
| [`XP_016867423.1`](https://www.ncbi.nlm.nih.gov/protein/XP_016867423.1) | NCBI Protein | Protéine RefSeq prédite (préfixe `XP_`) | 1 |
| `FOXP2 human`, `LDLR human` | [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene/) | Recherches de gènes | 2 |
| [`P00740`](https://www.uniprot.org/uniprotkb/P00740/entry) | UniProtKB | Facteur IX de coagulation humain | 3, 8 |
| [`P00748`](https://www.uniprot.org/uniprotkb/P00748/entry) | UniProtKB | Facteur XII de coagulation humain | 8 |
| [`HSF1`](https://www.uniprot.org/uniprotkb?query=HSF1+AND+reviewed%3Atrue) | UniProtKB | *Heat Shock Factor 1* (humain, souris, poulet) pour constituer un multi-FASTA | 10 |
| [`PF03460`](https://www.ebi.ac.uk/interpro/entry/pfam/PF03460/) | Pfam (InterPro) | Domaine Pfam chargé dans Jalview | 11 |
| [`alignment.fa`](http://www.jalview.org/tutorial/alignment.fa) | Site Jalview | Alignement d'exemple du tutoriel Jalview (`File → Input Alignment → From URL`) | 11 |
| [`BRCA2`](https://beta.ensembl.org/) | Ensembl | Exporter la séquence d'un gène | 16 |
| [`COMT`](https://agmp.afrigen-d.org) | AGMP | Associations pharmacogénomiques africaines | 17 |
| [`rs334`](https://www.ncbi.nlm.nih.gov/snp/rs334), [`rs4680`](https://www.ncbi.nlm.nih.gov/snp/rs4680), [`rs4860`](https://www.ncbi.nlm.nih.gov/snp/rs4860) | dbSNP / [AGVD](https://agvd.afrigen-d.org) | Variants à rechercher dans AGVD (`rs334` : drépanocytose, *HBB*) | 17 |
| [`rs1738074`](https://www.ncbi.nlm.nih.gov/snp/rs1738074) | dbSNP / Ensembl | SNP du 5′ UTR de *TAGAP* | 18 |
| [`rs7801903`](https://www.ncbi.nlm.nih.gov/snp/rs7801903) | dbSNP | Variant à écrire au format VCF | 18 |
| [`ENSP00000062863.3`](https://www.ensembl.org/Homo_sapiens/Transcript/ProteinSummary?p=ENSP00000062863) | Ensembl | Protéine pour l'exercice de notation HGVS | 18 |
| [`NC_000913.3`](https://www.ncbi.nlm.nih.gov/nuccore/NC_000913.3) | NCBI Nucleotide | Génome d'*E. coli* K-12 MG1655 (`K12.fasta`) | 19 |
| [`NC_002695`](https://www.ncbi.nlm.nih.gov/nuccore/NC_002695) | NCBI Nucleotide | Génome d'*E. coli* O157:H7 Sakai (`O157.fasta`) | 19 |

Pour le chapitre 19, les deux génomes se téléchargent en ligne de commande
avec les [E-utilities](https://www.ncbi.nlm.nih.gov/books/NBK25501/) du NCBI :

```bash
efetch -db nuccore -id NC_000913.3 -format fasta > K12.fasta
efetch -db nuccore -id NC_002695   -format fasta > O157.fasta
nucmer --prefix=ecoli K12.fasta O157.fasta
```

---

## Noms de fichiers génériques dans les commandes

Beaucoup de blocs de commandes du manuel (chapitres 6, 15, 16 et 18) utilisent
des noms **illustratifs**, qui ne correspondent à aucun fichier fourni :

| Nom dans le manuel | Remplacez-le par… |
|---|---|
| `sequences.fasta`, `genomes.fasta` | n'importe quel multi-FASTA, par exemple [`Pol21.fas`](données/chapitre-14-phylogenie/Pol21.fas) ou `demo_sequences.fasta` |
| `reads.fastq.gz`, `sample_R1.fastq.gz`, `input_R1.fastq.gz` | `demo_reads.fastq` (généré par [`create_bioinfo_files.sh`](données/chapitre-06-linux/create_bioinfo_files.sh)), ou un vrai jeu de lectures téléchargé depuis [ENA](https://www.ebi.ac.uk/ena/browser/) / [SRA](https://www.ncbi.nlm.nih.gov/sra) |
| `variants.vcf`, `fichier.vcf` | [`Variants_with_random_QUAL.vcf`](données/chapitre-06-linux/Variants_with_random_QUAL.vcf) |
| `positions.txt` | [`chromosomes_positions_file.txt`](données/chapitre-06-linux/chromosomes_positions_file.txt) |
| `ref.fasta`, `adapters.fa`, `aln.bam`… | fichiers produits ou téléchargés au fil du pipeline NGS du chapitre 15 |
| `genes.gff3.bgz`, `cdna.fa.bgz`, `pep.fa.bgz` | à télécharger sur le [FTP d'Ensembl](https://ftp.ebi.ac.uk/pub/ensemblorganisms/) (chapitre 16) |

---



## Origine des données

- **Séquences protéiques** (facteurs IX et XII, POL, FOXP2) : extraites
  d'[UniProtKB](https://www.uniprot.org), diffusée sous licence
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **Séquences nucléiques** (*HBB* des primates, 16S) : GenBank / NCBI, domaine
  public.
- **VCF du chapitre 6** : extrait du projet
  [1000 Genomes](https://www.internationalgenome.org) (chromosome 20, GRCh38),
  avec une colonne `QUAL` aléatoire ajoutée à des fins pédagogiques.
- **VCF du chapitre 18, scripts et fichiers de séance** : supports pratiques du
  cours *Introduction to Bioinformatics* de
  [H3ABioNet](https://www.h3abionet.org), édition 2026.
- **`iris.csv`** : jeu de données *Iris* de Fisher (1936), domaine public.

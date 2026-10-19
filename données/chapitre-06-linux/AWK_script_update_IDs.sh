################################################################################
#This awk script performs a genome coordinate-based join to annotate missing
#rsIDs in a VCF file using a lookup table.
################################################################################
awk '
BEGIN{OFS="\t"}

NR==FNR{
    if(FNR==1) next

    chr=$1
    pos=$2
    id=$3

    gsub(/\r/,"",chr)
    gsub(/\r/,"",pos)
    gsub(/\r/,"",id)

    gsub(/^chr/,"",chr)

    if(id=="." || id=="") next

    ids[chr"_"pos]=id
    next
}

/^#/ {print; next}

{
    chrom=$1
    pos=$2

    gsub(/^chr/,"",chrom)

    key=chrom"_"pos

    if($3=="." && key in ids)
        $3=ids[key]

    print
}
' chromosomes_positions_file.txt Variants_with_random_QUAL.vcf > Variants_with_random_QUAL_updated_IDs.vcf

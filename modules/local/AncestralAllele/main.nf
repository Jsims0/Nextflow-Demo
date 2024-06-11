process AncestralAllele {
   
   input:
   path(in_vcf)

   output:
   path('AncestralAllele.vcf'), emit: vcf

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/AncestralAllele.vcf" -plugin AncestralAllele,homo_sapiens_ancestor_GRCh38.fa.gz 
   """
}
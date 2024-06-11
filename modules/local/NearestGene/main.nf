process NearestGene {

   input:
   path(in_vcf)

   output:
   path('NearestGene.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/NearestGene.vcf" -plugin NearestGene
   """
}

process CSN {
   //VEP pluginthat reports Clinical Sequencing Nomenclature (CSN) for variants

   input:
   path(in_vcf)

   output:
   path('CSN.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/CSN.vcf" -plugin CSN
   """
}
process Carol {

   input:
   path(in_vcf)

   output:
   path('Carol.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/Carol.vcf" -plugin Carol
   """
}
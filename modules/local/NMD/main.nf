process NMD {

   input:
   path(in_vcf)

   output:
   path('NMD.vcf')

   """
   loc=`pwd`
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/$in_vcf" --output_file "\${loc}/NMD.vcf" -plugin NMD
   """
}
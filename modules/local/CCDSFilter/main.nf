process CCDSFilter {
  
   input:
   tuple val(chrom), val(pos), val(id), val(ref), val(alt), val(qual), val(filter), val(info) 

   output:
   path('CCDS.vcf')
   

   """
   loc=`pwd`
   echo -e '$chrom\t$pos\t$id\t$ref\t$alt\t$qual\t$filter\t$info' > one.vcf
   vep --cache --offline --format vcf --vcf --force_overwrite --input_file "\${loc}/one.vcf" --output_file "\${loc}/CCDS.vcf" -plugin CCDSFilter
   """
}
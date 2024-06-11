
include { CCDSFilter } from './modules/local/CCDSFilter'
include { CSN } from './modules/local/CSN'
include { Carol } from './modules/local/Carol'
include { Downstream } from './modules/local/Downstream'
include { Draw } from './modules/local/Draw'
include { GXA } from './modules/local/GXA'
include { LOVD } from './modules/local/LOVD'
include { NMD } from './modules/local/NMD'
include { NearestGene } from './modules/local/NearestGene'
include { AncestralAllele } from './modules/local/AncestralAllele'
include { makeHeader } from './modules/local/makeHeader'
include { CompileVCF } from './modules/local/CompileVCF'


workflow {
   input_vcf = Channel.fromPath(params.input)
   //splits input vcf into a string of each line, split converts this to a map of each line then to toList converts it to the expected list type for future operators
   input_vcf.splitText( decompress:true ) { it.split().toList() } 
   //using the logic of how vcf files are built, put all header information into one channel and all genomic regions into another
	    .branch {
		header: it.first() =~ '#' 
		body: it.first() !=~ '#'
	     }
	    .set { processed_vcf }
   CCDSFilter(processed_vcf.body) | CSN | Carol | Downstream | Draw | GXA | LOVD | NMD | NearestGene | AncestralAllele
   CompileVCF(AncestralAllele.out.vcf.collect(), input_vcf)
}
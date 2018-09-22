package top.macaulish.PLS

import org.junit.Test
import java.util.*

class Test {

    @Test
    fun testPrint(){
        println("123213\$ggg")
        sendTask(UUID.randomUUID().toString())
    }

    fun sendTask(taskGuid:String):Boolean{
        val source = "source/$taskGuid"
        val result = "result/$taskGuid"
        val log = result+"/log.txt"
        val sh = "CUDA_VISIBLE_DEVICES=3 python2 \$DETECTRON/tools/infer_simple.py\n" +
                "--cfg \$DETECTRON/configs/panet/mask_bpa_adp_dcn_ctx_hh_res50.yaml\n" +
                "--image-ext jpg\n" +
                "--output-dir " + result + "\n" +
                "--wts /DATACENTER1/wdk/tmp/mask_bpa_adp_dcn_hh_prelu_res50/train/coco_2017_train/generalized_rcnn/model_final.pkl\n" +
                source+"/result" + " | " + log
        print(sh)
        //Runtime.getRuntime().exec(sh)
        return true
    }
}
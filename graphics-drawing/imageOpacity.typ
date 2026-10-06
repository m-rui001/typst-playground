#import "@preview/based:0.1.0": base64
#import "@preview/oxifmt:0.2.0": strfmt
#let svgOpacity(path,format:auto,width:auto,height:auto,alt:none,
              opacity: 1,fit:"contain" ) = {
      let original = read(path)
      //如果<svg ...>标签中有opacity属性，先去掉
      let changed = original.replace(regex("(<svg[^>]*?)opacity\s*=\s*\"[\.\d]+\""),(r)=>{  r.captures.at(0)})
      // 在<svg 标签中加opacity属性
      changed=changed.replace("<svg","<svg opacity=\""+str(opacity)+"\"")
      fit = (cover:"cover",contain:"contain",stretch:"stretch").at(fit,default:"contain")
      if opacity < 0 { opacity = 0
      } else if opacity > 1  {opacity = 1 }
      image.decode(changed,format: format,width: width,height: height,alt: alt,fit: fit)
}

#let _svgTemplate = ```
<svg width="{width}" height="{height}" opacity="{opacity}" xmlns="http://www.w3.org/2000/svg" 
     xmlns:xlink="http://www.w3.org/1999/xlink" >
      <image xlink:href="data:image/{imgFormat};base64,{imgBase64Str}"
         x="0" y="0" width="{width}" height="{height}" />
</svg>
```.text

#let imageOpacity(path,format:auto,width:auto,height:auto,alt:none,
              opacity: 1,fit:"contain" )={
      let imgFmt
      if format==auto {
            let pathStrs = path.split(".")
            if pathStrs.len() > 1 {imgFmt = pathStrs.at(-1)   }
      }else {imgFmt=format }
      let imgFormat = (png:"png",jpg:"jpeg",jpeg:"jpeg",gif:"gif",bmp:"bmp").at(imgFmt,default:none)
      let imgBase64Str = base64.encode(read(path,encoding: none))
      context {
        let imgInfo=measure(image(path))
        let svg=strfmt(_svgTemplate,opacity:opacity,
               width:str(imgInfo.width/1pt),height:str(imgInfo.height/1pt),imgBase64Str:imgBase64Str,imgFormat:imgFormat)
        image.decode(svg,width: width,height: height,alt: alt,fit: fit)
      }
}



// #let imgOpacity(path,format:auto,width:auto,height:auto,
//                   alt:none,opacity: 1,fit:"contain", ) ={
//         let iformat
//         if format==auto {
//           let pathStrs = path.split(".")
          
//           if pathStrs.len() > 1 {
//             iformat = pathStrs.at(-1)
//           }
//         }
 
//         if iformat == "svg" {
//           return _svgImage(
//           path,format: format,opacity:opacity,
//           width: width,height: height,alt: alt,fit: fit)
//         }else{
//           return imageOpacity(path,format:auto,width:auto,height:auto,alt:none,
//               opacity: 1,fit:"contain" )
//         }
        
//       }

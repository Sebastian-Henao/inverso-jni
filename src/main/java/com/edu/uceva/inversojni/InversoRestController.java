package com.edu.uceva.inversojni;

import libinverso.JavaInverso;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/api/inversojni-service")
public class InversoRestController {
    private JavaInverso inversor;

    public InversoRestController(){
        this.inversor = new JavaInverso();
    }

    @GetMapping("/inverso/{a}/{m}")
    public String inverso(@PathVariable int a, @PathVariable int m)  {return inversor.inversoJSON(a, m);}
}

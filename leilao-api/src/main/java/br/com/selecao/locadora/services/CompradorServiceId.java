package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.CompradorBO;
import br.com.selecao.locadora.entity.Comprador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/comprador/{id}")
public class CompradorServiceId {

    @Autowired
    private CompradorBO compradorBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(compradorBO.buscarPorId(id));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<?> deletarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(compradorBO.deletarPorId(id));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> alterarPorId(@PathVariable Long id, @RequestBody Comprador novoComprador) {
        return ResponseEntity.ok().body(compradorBO.alterarCompradorId(id, novoComprador));
    }
}
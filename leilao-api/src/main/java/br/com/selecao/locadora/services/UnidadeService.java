package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.UnidadeBO;
import br.com.selecao.locadora.entity.Unidade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/unidades")
public class UnidadeService {

    @Autowired
    private UnidadeBO unidadeBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarTodos() {
        return ResponseEntity.ok().body(unidadeBO.buscarTodos());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> inserirUnidade(@RequestBody Unidade unidade) {
        return ResponseEntity.ok().body(unidadeBO.inserirUnidade(unidade));
    }
}
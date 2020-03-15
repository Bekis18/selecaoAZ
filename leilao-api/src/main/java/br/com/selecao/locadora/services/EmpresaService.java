package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.EmpresaBO;
import br.com.selecao.locadora.entity.Empresa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/empresa")
public class EmpresaService {

    @Autowired
    private EmpresaBO empresaBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarTodos() {
        return ResponseEntity.ok().body(empresaBO.buscarTodos());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> inserirEmpresa(@RequestBody Empresa empresa) {
        return ResponseEntity.ok().body(empresaBO.inserirEmpresa(empresa));
    }
}
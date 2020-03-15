package br.com.selecao.locadora.business;

import br.com.selecao.locadora.entity.Unidade;
import br.com.selecao.locadora.repository.UnidadeRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Service
public class UnidadeBO {

    @Autowired
    private UnidadeRepository unidadeRepository;

    ObjectMapper mapper = new ObjectMapper();

    public List<Unidade> buscarTodos(){
        try {
            return unidadeRepository.findAll();
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Unidade buscarPorId(Long id) {
        try {
            return unidadeRepository.findOne(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Unidade inserirUnidade(Unidade unidade) {
        try {
            unidade.setCreatedAt(LocalDateTime.now());
            unidade.setUpdateAt(LocalDateTime.now());
            return unidadeRepository.save(unidade);
        } catch (Exception e) {
            return null;
        }
    }

    public Unidade alterarUnidadeId(Long id, Unidade unidadeNova) {
        try {
            Unidade unidadeAtual = buscarPorId(id);

            unidadeNova.setCreatedAt(unidadeAtual.getCreatedAt());
            unidadeNova.setUpdateAt(LocalDateTime.now());

            return unidadeRepository.save(unidadeNova);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean deletarPorId(Long id) {
        try {
            unidadeRepository.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return false;
        }
    }

}

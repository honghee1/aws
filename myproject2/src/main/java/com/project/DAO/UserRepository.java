package com.project.DAO;

import java.util.Optional;

public interface UserRepository  {
    Optional<AdminDTO> findByusername(String username); //사용자를 조회하는 기능 필요
}
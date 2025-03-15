package br.com.bruckner.hello.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        // configura a seguranca das  URLs
        http
                .authorizeHttpRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/login", "/css/**").permitAll() //permitir acesso à página de login e recursos estáticos (como CSS)
                                .anyRequest().authenticated() //exigir autenticacao para qualquer outra URL
                )
                .formLogin(formLogin ->
                        formLogin
                                .loginPage("/login") //definir pagina de login customizada
                                .defaultSuccessUrl("/home", true) //redirecionar após login com sucesso
                                .permitAll()
                )
                .logout(logout ->
                        logout
                                .logoutUrl("/index") // URL de logout
                                .permitAll()
                );

        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService (){
        //criando usuario em memoria para teste
        UserDetails user = User.withDefaultPasswordEncoder()
                .username("user")
                .password("password")
                .roles("USER")
                .build();

        return new InMemoryUserDetailsManager(user);
    }

}

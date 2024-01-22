import React, { useState } from 'react';
import Header from '../components/Header';
import styled from 'styled-components';
import ButtonContainer from '../components/buttons/ButtonContainer';

const HeadingName = styled.h1`
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 50px;
  color: #00308f;
`;

const FormContainer = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  height: 70vh;
`;

const Form = styled.form`
  display: flex;
  flex-direction: column;
  width: 50%;
  align-items: center;
  gap: 20px;
`;

const Input = styled.input`
  width: 80%;
  padding: 10px;
  border: 2px solid #00308f;
  color: #00308f;
  &:focus {
    outline: none;
    border-color: #00308f;
  }
`;

function ProfesorScreen() {
  return (
    <>
     
      <HeadingName>Profesori</HeadingName>
      <FormContainer>
        <Form>
          <Input
            type='text'
            name='ime'
            placeholder='Ime'
          />
          <Input
            type='text'
            name='prezime'
            placeholder='Prezime'
          />
          <Input
            type='text'
            name='oib'
            placeholder='OIB'
          />
          <ButtonContainer />
        </Form>
      </FormContainer>
    </>
  );
}

export default ProfesorScreen;

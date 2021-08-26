# frozen_string_literal: true

require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resume = resumes(:one)
  end

  test 'should get index' do
    get resumes_url
    assert_response :success
  end

  test 'should get new' do
    get new_resume_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Resume.count') do
      post resumes_url, params: { resume: {
        name: 'RoR Developer',
        contact: 'hexlet',
        educations_attributes: {
          '0': {
            institution: 'test',
            faculty: 'faculty',
            begin_date: '1988-08-08'
          }
        },
        works_attributes: {
          '0': {
            company: 'Hexlet',
            begin_date: '1988-08-08'
          }
        }
      } }
    end

    assert_redirected_to resume_url(Resume.last)
  end

  test 'should show post' do
    get resume_url(@resume)
    assert_response :success
  end

  test 'should get edit' do
    get edit_resume_url(@resume)
    assert_response :success
  end

  test 'should update resume' do
    patch resume_url(@resume), params: { resume: {
      name: 'Awesome developer',
      contact: 'my_tg'
    } }
    assert_redirected_to resume_url(@resume)
  end

  test 'should destroy resume' do
    assert_difference('Resume.count', -1) do
      delete resume_url(@resume)
    end

    assert_redirected_to resumes_url
  end
end

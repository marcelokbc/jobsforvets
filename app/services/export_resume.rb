require 'zip'

class ExportResume

  def initialize(user, position, zip_name)
    @user = user
    @position = position
    @zip_name = zip_name
  end

  def generate
    applicants = @position.applicants
    files = []
    applicants.each do |applicant|
      files << save_files_on_server(applicant)
    end

    create_temporary_zip_file(files)
  end

  def save_files_on_server(applicant)
    temp_folder = File.join(Rails.root.join('tmp','resumes'))
    FileUtils.mkdir_p(temp_folder) unless Dir.exist?(temp_folder)

    file_name = "#{applicant.name.parameterize}-#{applicant.resume.filename}"
    file_path = File.join(temp_folder, file_name)
    File.open(file_path, 'wb') { |f| f.write(applicant.resume.download)}
    file_path
  end

  def create_temporary_zip_file(files_paths)
    temp_file = File.open(Rails.root.join('tmp', @zip_name), 'wb')
    begin
      Zip::OutputStream.open(temp_file) { |zos| }

      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
        files_paths.each do |file_path|
          file_name = File.basename(file_path)
          zip.add(file_name, file_path)
        end
      end  
    ensure
      temp_file.close
      files_paths.each { |file_path| FileUtils.rm(file_path) }
    end
  end
end
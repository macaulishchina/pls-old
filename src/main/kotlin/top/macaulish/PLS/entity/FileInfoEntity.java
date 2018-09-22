package top.macaulish.PLS.entity;

import java.util.Objects;

public class FileInfoEntity {
    private int id;
    private String guid;
    private String fileName;
    private String fileSize;
    private String taskGuid;
    private String savePath;
    private String saveHost;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getTaskGuid() {
        return taskGuid;
    }

    public void setTaskGuid(String taskGuid) {
        this.taskGuid = taskGuid;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getSaveHost() {
        return saveHost;
    }

    public void setSaveHost(String saveHost) {
        this.saveHost = saveHost;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FileInfoEntity that = (FileInfoEntity) o;
        return id == that.id &&
                Objects.equals(guid, that.guid) &&
                Objects.equals(fileName, that.fileName) &&
                Objects.equals(fileSize, that.fileSize) &&
                Objects.equals(taskGuid, that.taskGuid) &&
                Objects.equals(savePath, that.savePath) &&
                Objects.equals(saveHost, that.saveHost);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, guid, fileName, fileSize, taskGuid, savePath, saveHost);
    }
}
